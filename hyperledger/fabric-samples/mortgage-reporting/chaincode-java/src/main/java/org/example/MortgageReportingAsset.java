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
    private String submittingFirm;

    @Property()
    private String submittingDepartment;


    public MortgageReportingAsset() {
    }

    public static MortgageReportingAsset createInstance(String reportIdentifier, String reportCreationDate, String reportContent,
        String submittingFirm, String submittingDepartment) {

        MortgageReportingAsset newAsset = new MortgageReportingAsset();
        newAsset.setReportIdentifier(reportIdentifier);
        newAsset.setReportCreationDate(reportCreationDate);
        newAsset.setReportContent(reportContent);
        newAsset.setSubmittingFirm(submittingFirm);
        newAsset.setSubmittingDepartment(submittingDepartment);

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
        String submittingDepartment = obj.getString("submittingDepartment");
        
        return createInstance(reportIdentifier, reportCreationDate, reportContent, submittingFirm, submittingDepartment);
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

    public String getSubmittingDepartment() {
        return submittingDepartment;
    }

    public void setSubmittingDepartment(String submittingDepartment) {
        this.submittingDepartment = submittingDepartment;
    }
}
