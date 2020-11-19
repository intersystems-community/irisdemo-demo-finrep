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

    public String Channel;

    public String Contract;
    
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

    public void SubmitReportToHyperledger(Object request) throws Exception {

        String responseMsg = "Empty Response Value";

        IRISObject req = (IRISObject) request;

        try (Gateway gateway = connect()) {

            String reportIdentifier = req.getString("ReportIdentifier");
            String reportCreationDate = req.getString("ReportCreationDate");
            String submittingFirm = req.getString("SubmittingFirm");
            String reportURL = req.getString("ReportURL");

            // get the network and contract
			Network network = gateway.getNetwork(this.Channel);
            Contract contract = network.getContract(this.Contract);
            
            LOGINFO("Submit Transaction: CreateMortgageReportingAsset: " + reportIdentifier);
			contract.submitTransaction("createMortgageReportingAsset", reportIdentifier, reportCreationDate, reportURL, submittingFirm);
        }
        catch(Exception e){
            System.err.println(e);
            LOGINFO("FAILED TO SUBMIT TRANSACTIONS");
            LOGINFO(e.getMessage());
        }
    }
}