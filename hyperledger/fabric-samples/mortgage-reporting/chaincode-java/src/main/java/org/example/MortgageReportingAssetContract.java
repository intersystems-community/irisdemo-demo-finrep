/*
 * SPDX-License-Identifier: Apache-2.0
 */
package org.example;

import java.io.InputStream;
import java.security.MessageDigest;

import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;

import org.hyperledger.fabric.contract.Context;
import org.hyperledger.fabric.contract.ContractInterface;
import org.hyperledger.fabric.contract.annotation.Contract;
import org.hyperledger.fabric.contract.annotation.Default;
import org.hyperledger.fabric.contract.annotation.Transaction;
import org.hyperledger.fabric.contract.annotation.Transaction.TYPE;
import org.hyperledger.fabric.contract.annotation.Contact;
import org.hyperledger.fabric.contract.annotation.Info;
import org.hyperledger.fabric.contract.annotation.License;
import static java.nio.charset.StandardCharsets.UTF_8;

import org.apache.commons.io.IOUtils;
import org.apache.http.client.HttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.HttpResponse;
import org.apache.http.auth.AuthScope;
import org.apache.http.auth.UsernamePasswordCredentials;
import org.apache.http.client.CredentialsProvider;
import org.apache.http.impl.client.BasicCredentialsProvider;


@Contract(name = "MortgageReportingAssetContract",
    info = @Info(title = "MortgageReportingAssetContract",
                description = "Smart Contract for Reporting PSD001 and PSD007 Assets",
                version = "1.0-SNAPSHOT",
                license =
                        @License(name = "SPDX-License-Identifier: Apache-2.0",
                                url = ""),
                                contact =  @Contact(email = "MortgageReportingAssetContract@example.com",
                                                name = "MortgageReportingAssetContract",
                                                url = "http://MortgageReportingAssetContract.me")))
@Default
public class MortgageReportingAssetContract implements ContractInterface {

    public MortgageReportingAssetContract() {
    }

    //Helper Method to validate that XML document is well formed.
    private Document validateTestDocument(InputStream XMLDocStream) throws Exception {
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        factory.setNamespaceAware(true);
        return factory.newDocumentBuilder().parse(XMLDocStream);
    }

    private CredentialsProvider generateCredentials() {
        CredentialsProvider provider = new BasicCredentialsProvider();
		UsernamePasswordCredentials credentials = new UsernamePasswordCredentials("SuperUser", "sys");
        provider.setCredentials(AuthScope.ANY, credentials);
        return provider;
    }

    private String bytesToHex(byte[] bytes) {
        StringBuilder sb = new StringBuilder();
        for (byte b : bytes) {
            sb.append(String.format("%02x", b));
        }
        return sb.toString();
    }

    //Helper Method returns the Hexidecimal string representation of a 256 Bit FCA reporting Hash
    private String getCryptographicDocumentSeal(String documentURL) throws Exception{
        HttpClient client = HttpClientBuilder.create()
		.setDefaultCredentialsProvider(generateCredentials())
		.build();
		
		HttpGet request = new HttpGet(documentURL);

		HttpResponse response = client.execute(request);

		byte[] docBytes = IOUtils.toByteArray(response.getEntity().getContent());
		
		MessageDigest digest = MessageDigest.getInstance("SHA-256");
		byte[] sha256DocumentHash = digest.digest(docBytes);
		
		return bytesToHex(sha256DocumentHash);
    }

    @Transaction()
    public boolean mortgageReportingAssetExists(Context ctx, String reportIdentifier) {
        byte[] buffer = ctx.getStub().getState(reportIdentifier);
        return (buffer != null && buffer.length > 0);
    }

    @Transaction()
    public void createMortgageReportingAsset(Context ctx, String reportIdentifier, String reportCreationDate, String reportURL, String submittingFirm) {
        boolean exists = mortgageReportingAssetExists(ctx,reportIdentifier);
        if (exists) {
            throw new RuntimeException("The asset "+reportIdentifier+" already exists");
        }
        try{
            String cryptoGraphicContentSeal = getCryptographicDocumentSeal(reportURL);
            MortgageReportingAsset asset = MortgageReportingAsset.createInstance(reportIdentifier, reportCreationDate, cryptoGraphicContentSeal, reportURL, submittingFirm);

            asset.setReportIdentifier(reportIdentifier);
            asset.setReportCreationDate(reportCreationDate);
            asset.setReportContent(cryptoGraphicContentSeal);
            asset.setReportURL(reportURL);
            asset.setSubmittingFirm(submittingFirm);

            ctx.getStub().putState(reportIdentifier, asset.toJSONString().getBytes(UTF_8));

        }catch(Exception e){
            throw new RuntimeException(e.toString());
        }
    }

    @Transaction()
    public MortgageReportingAsset getMortgageReportingAsset(Context ctx, String reportIdentifier) {
        boolean exists = mortgageReportingAssetExists(ctx,reportIdentifier);
        if (!exists) {
            throw new RuntimeException("The asset "+reportIdentifier+" does not exist");
        }

        MortgageReportingAsset newAsset = MortgageReportingAsset.fromJSONString(new String(ctx.getStub().getState(reportIdentifier),UTF_8));

        return newAsset;
    }

    @Transaction()
    public void deleteMortgageReportingAsset(Context ctx, String reportIdentifier) {
        boolean exists = mortgageReportingAssetExists(ctx, reportIdentifier);
        if (!exists) {
            throw new RuntimeException("The asset "+reportIdentifier+" does not exist");
        }
        ctx.getStub().delState(reportIdentifier);
    }
}