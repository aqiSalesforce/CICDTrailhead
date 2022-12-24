trigger NubikademyAccountTrigger on Account (before update) {

    NubikademyAccountHelper.fillAccount(Trigger.new);
}