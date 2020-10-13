package irisdemo.hyperledger;

import java.io.File;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Random;

import org.apache.commons.io.FileUtils;
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

    public static String Channel;

    public static String Contract;

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

            String reportIdentifier = req.getString("ReportIdentifier");
            String reportCreationDate = req.getString("ReportCreationDate");
            String submittingFirm = req.getString("SubmittingFirm");
            String submittingDepartment = req.getString("SubmittingDepartment");
            String reportContent = req.getString("ReportContent");
            //String reportContent = FileUtils.readFileToString(new File(req.getString("ReportContentFile")), StandardCharsets.UTF_8);

            // get the network and contract
			Network network = gateway.getNetwork("mychannel");
			Contract contract = network.getContract("PSD001AssetContract");
            
            LOGINFO("Submit Transaction: CreatePSD001Asset: " + reportIdentifier);
			contract.submitTransaction("createPSD001", reportIdentifier, reportCreationDate, reportContent, submittingFirm, submittingDepartment);

            LOGINFO("Evaluate Transaction: getAsset: " + reportIdentifier);
            byte[] result;
            // ReadAsset returns an asset with given assetID
			result = contract.evaluateTransaction("getPSD001Asset", reportIdentifier);
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