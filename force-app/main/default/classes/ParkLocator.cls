public class ParkLocator {
    public static List<String> country(String country) {
        ParkService.ParksImplPort calculator = 
            new ParkService.ParksImplPort();
        return calculator.byCountry('Germany');
    }
}