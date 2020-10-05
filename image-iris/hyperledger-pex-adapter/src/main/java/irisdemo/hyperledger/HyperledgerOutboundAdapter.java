package irisdemo.hyperledger;

import java.nio.charset.Charset;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Random;

import org.hyperledger.fabric.gateway.Contract;
import org.hyperledger.fabric.gateway.Gateway;
import org.hyperledger.fabric.gateway.Network;
import org.hyperledger.fabric.gateway.Wallet;
import org.hyperledger.fabric.gateway.Wallets;

import com.intersystems.enslib.pex.*;
import com.intersystems.jdbc.IRISObject;
import com.intersystems.jdbc.IRIS;
import com.intersystems.gateway.GatewayContext;

public class HyperledgerOutboundAdapter extends com.intersystems.enslib.pex.OutboundAdapter {
    // Connection to InterSystems IRIS
    private IRIS iris;

    /*static {
		System.setProperty("org.hyperledger.fabric.sdk.service_discovery.as_localhost", "true");
    }*/
    
    // helper function for getting connected to the gateway
	public static Gateway connect() throws Exception{
		// Load a file system based wallet for managing identities.
		Path walletPath = Paths.get("/hyperledger/wallet");
		Wallet wallet = Wallets.newFileSystemWallet(walletPath);
		// load a CCP
		Path networkConfigPath = Paths.get("/hyperledger/certs", "connection-org1.yaml");

		Gateway.Builder builder = Gateway.createBuilder();
		builder.identity(wallet, "appUser").networkConfig(networkConfigPath); //.discovery(true);
		return builder.connect();
	}

    @Override
    public void OnInit() throws Exception {
        iris = GatewayContext.getIRIS();
        LOGINFO("INITIALIZING PEX ADAPTER");
        try {
            LOGINFO("ENROLLING HYPERLEDGER USERS");
			EnrollAdmin.main(null);
			RegisterUser.main(null);
		} catch (Exception e) {
            LOGINFO("FAILED TO ENROLL HYPERLEDGER USERS");
            LOGINFO(e.getMessage());
			System.err.println(e);
		}
        return;
    }

    @Override
    public void OnTearDown() throws Exception {
        return;
    }

    public Object TestAdapter(Object request) throws Exception {

        String responseMsg = "Empty Response Value";

        IRISObject req = (IRISObject) request;
        LOGINFO("Received object: " + req.invokeString("%ClassName", 1));
        // Return record info

        try (Gateway gateway = connect()) {

            // get the network and contract
			Network network = gateway.getNetwork("mychannel");
			Contract contract = network.getContract("PSD001AssetContract");

			byte[] result;

            System.out.println("\n");
            System.out.println("Submit Transaction: CreatePSD001Asset report1");
            LOGINFO("Submit Transaction: CreatePSD001Asset report1");
            //CreateAsset creates an asset with ID asset13, color yellow, owner Tom, size 5 and appraisedValue of 1300
            
            byte[] array = new byte[7]; // length is bounded by 7
            new Random().nextBytes(array);
            String generatedString = new String(array, Charset.forName("UTF-8"));

			contract.submitTransaction("createPSD001", generatedString, "2020-09-28", "<xml>Test<xml>", "ISC", "Sales");

			System.out.println("\n");
			System.out.println("Evaluate Transaction: getAsset report1");
			// ReadAsset returns an asset with given assetID
			result = contract.evaluateTransaction("getPSD001Asset", "report1");
            System.out.println("result: " + new String(result));
            responseMsg = new String(result);
        }
        catch(Exception e){
            System.err.println(e);
            LOGINFO("FAILED TO SUBMIT TRANSACTIONS");
            LOGINFO(e.getMessage());
		}

        IRISObject response = (IRISObject)(iris.classMethodObject("Ens.StringContainer","%New",responseMsg));
        return response;
    }
}