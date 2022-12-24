@isTest
private class ParkLocatorTest {
    @isTest static void testCallout() {              
        // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        List<String> result = ParkLocator.country('Munich');
        // Verify that a fake result is returned
        System.assertNotEquals(null, result); 
    }
}