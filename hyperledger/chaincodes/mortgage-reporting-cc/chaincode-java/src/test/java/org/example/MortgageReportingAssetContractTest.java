/*
 * SPDX-License-Identifier: Apache License 2.0
 */

package org.example;

import static java.nio.charset.StandardCharsets.UTF_8;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

import org.hyperledger.fabric.contract.Context;
import org.hyperledger.fabric.shim.ChaincodeStub;
import org.junit.jupiter.api.Nested;
import org.junit.jupiter.api.Test;


public final class MortgageReportingAssetContractTest {

    public static String createJSONObject(){
        return "{\"reportCIdentifier\":\"10001\",\"reportContent\":\"blah\",\"submittingFirm\":\"ISC\",\"submittingDepartment\":\"Sales\"}";
    }

    @Nested
    class AssetExists {
        @Test
        public void noProperAsset() {

            MortgageReportingAssetContract contract = new  MortgageReportingAssetContract();
            Context ctx = mock(Context.class);
            ChaincodeStub stub = mock(ChaincodeStub.class);
            when(ctx.getStub()).thenReturn(stub);

            when(stub.getState("10001")).thenReturn(new byte[] {});
            boolean result = contract.mortgageReportingAssetExists(ctx,"10001");

            assertFalse(result);
        }

        @Test
        public void assetAlreadyExists() {

            MortgageReportingAssetContract contract = new MortgageReportingAssetContract();
            Context ctx = mock(Context.class);
            ChaincodeStub stub = mock(ChaincodeStub.class);
            when(ctx.getStub()).thenReturn(stub);

            when(stub.getState("10001")).thenReturn(new byte[] {42});
            boolean result = contract.mortgageReportingAssetExists(ctx,"10001");

            assertTrue(result);

        }

        @Test
        public void noKey() {
            MortgageReportingAssetContract contract = new MortgageReportingAssetContract();
            Context ctx = mock(Context.class);
            ChaincodeStub stub = mock(ChaincodeStub.class);
            when(ctx.getStub()).thenReturn(stub);

            when(stub.getState("10002")).thenReturn(null);
            boolean result = contract.mortgageReportingAssetExists(ctx,"10002");

            assertFalse(result);

        }

    }

    @Nested
    class AssetCreates {

        /*@Test
        public void newAssetCreate() {
            PSD001AssetContract contract = new PSD001AssetContract();
            Context ctx = mock(Context.class);
            ChaincodeStub stub = mock(ChaincodeStub.class);
            when(ctx.getStub()).thenReturn(stub);

            String json = createJSONObject();
            //String json = "{\"value\":\"TheAsset\"}";

            contract.createPSD001(ctx, "10001", "2020-09-28", "<Test>Test</Test>","ISC", "Sales");

            verify(stub).putState("10001", json.getBytes(UTF_8));
        }*/

        @Test
        public void alreadyExists() {
            MortgageReportingAssetContract contract = new  MortgageReportingAssetContract();
            Context ctx = mock(Context.class);
            ChaincodeStub stub = mock(ChaincodeStub.class);
            when(ctx.getStub()).thenReturn(stub);

            when(stub.getState("10002")).thenReturn(new byte[] { 42 });

            Exception thrown = assertThrows(RuntimeException.class, () -> {
                contract.createPSD001(ctx, "10002", "2020-09-28", "<Test>Test</Test>","ISC", "Sales");
            });

            assertEquals(thrown.getMessage(), "The asset 10002 already exists");

        }

    }

    @Test
    public void assetDelete() {
        MortgageReportingAssetContract contract = new MortgageReportingAssetContract();
        Context ctx = mock(Context.class);
        ChaincodeStub stub = mock(ChaincodeStub.class);
        when(ctx.getStub()).thenReturn(stub);
        when(stub.getState("10001")).thenReturn(null);

        Exception thrown = assertThrows(RuntimeException.class, () -> {
            contract.deleteMortgageReportingAsset(ctx, "10001");
        });

        assertEquals(thrown.getMessage(), "The asset 10001 does not exist");
    }

}