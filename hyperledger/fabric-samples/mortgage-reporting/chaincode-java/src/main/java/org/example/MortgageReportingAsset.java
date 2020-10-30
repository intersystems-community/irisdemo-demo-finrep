/*
 * SPDX-License-Identifier: Apache-2.0
 */

package org.example;

import org.hyperledger.fabric.contract.annotation.Contract;
import org.hyperledger.fabric.contract.annotation.DataType;
import org.hyperledger.fabric.contract.annotation.Property;
import org.json.JSONObject;

@DataType()
public class MortgageReportingAsset {

    @Property()
    private String reportIdentifier;

    @Property()
    private String reportCreationDate;

    @Property()
    private String reportContent;

    @Property()
    private String reportURL;

    @Property()
    private String submittingFirm;

    public MortgageReportingAsset() {
    }

    public static MortgageReportingAsset createInstance(String reportIdentifier, String reportCreationDate, String reportContent,
        String reportURL, String submittingFirm) {

        MortgageReportingAsset newAsset = new MortgageReportingAsset();
        newAsset.setReportIdentifier(reportIdentifier);
        newAsset.setReportCreationDate(reportCreationDate);
        newAsset.setReportContent(reportContent);
        newAsset.setReportURL(reportURL);
        newAsset.setSubmittingFirm(submittingFirm);

        return newAsset; 
    }

    public String toJSONString() {
        return new JSONObject(this).toString();
    }

    public static MortgageReportingAsset fromJSONString(String json) {

        JSONObject obj = new JSONObject(json);

        String reportIdentifier = obj.getString("reportIdentifier");
        String reportCreationDate = obj.getString("reportCreationDate");
        String reportContent = obj.getString("reportContent");
        String submittingFirm = obj.getString("submittingFirm");
        String reportURL = obj.getString("reportURL");
        
        return createInstance(reportIdentifier, reportCreationDate, reportContent, reportURL, submittingFirm);
    }

    public String getReportIdentifier() {
        return reportIdentifier;
    }

    public void setReportIdentifier(String reportIdentifier) {
        this.reportIdentifier = reportIdentifier;
    }

    public String getReportCreationDate() {
        return reportCreationDate;
    }

    public void setReportCreationDate(String reportCreationDate) {
        this.reportCreationDate = reportCreationDate;
    }

    public String getReportContent() {
        return reportContent;
    }

    public void setReportContent(String reportContent) {
        this.reportContent = reportContent;
    }

    public String getSubmittingFirm() {
        return submittingFirm;
    }

    public void setSubmittingFirm(String submittingFirm) {
        this.submittingFirm = submittingFirm;
    }

    public String getReportURL() {
        return reportURL;
    }

    public void setReportURL(String reportURL) {
        this.reportURL = reportURL;
    }
}
