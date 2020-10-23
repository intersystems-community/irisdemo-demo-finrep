/*
 * SPDX-License-Identifier: Apache-2.0
 */
package org.example;

import org.hyperledger.fabric.contract.Context;
import org.hyperledger.fabric.contract.ContractInterface;
import org.hyperledger.fabric.contract.annotation.Contract;
import org.hyperledger.fabric.contract.annotation.Default;
import org.hyperledger.fabric.contract.annotation.Transaction;

import org.hyperledger.fabric.contract.annotation.Contact;
import org.hyperledger.fabric.contract.annotation.Info;
import org.hyperledger.fabric.contract.annotation.License;
import static java.nio.charset.StandardCharsets.UTF_8;

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

    @Transaction()
    public boolean mortgageReportingAssetExists(Context ctx, String reportIdentifier) {
        byte[] buffer = ctx.getStub().getState(reportIdentifier);
        return (buffer != null && buffer.length > 0);
    }

    @Transaction()
    public void createMortgageReportingAsset(Context ctx, String reportIdentifier, String reportCreationDate, String reportContent, String submittingFirm, String submittingDepartment) {
        boolean exists = mortgageReportingAssetExists(ctx,reportIdentifier);
        if (exists) {
            throw new RuntimeException("The asset "+reportIdentifier+" already exists");
        }
        MortgageReportingAsset asset = MortgageReportingAsset.createInstance(reportIdentifier, reportCreationDate, reportContent, submittingFirm, submittingDepartment);

        asset.setReportIdentifier(reportIdentifier);
        asset.setReportCreationDate(reportCreationDate);
        asset.setReportContent(reportContent);
        asset.setSubmittingFirm(submittingFirm);
        asset.setSubmittingDepartment(submittingDepartment);
        ctx.getStub().putState(reportIdentifier, asset.toJSONString().getBytes(UTF_8));
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

    public String validateReportingAsset() {
        return "Reporting Asset Validated";
    }

}