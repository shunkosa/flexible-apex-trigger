/**
 * @name FAT_LoggerEventTriggerServiceTest.cls
 * @description test class for FAT_LoggerEventTriggerService
 */
@isTest(SeeAllData=false)
private class FAT_LoggerEventTriggerServiceTest {
  @isTest
  static void fetchDebugLogs() {
    FAT_CommonLogger logger = FAT_CommonLogger.getInstance();
    logger.store(LoggingLevel.DEBUG, 'test');

    FAT_CommonLoggerHelper helper = FAT_CommonLoggerHelper.getInstance();
    List<FAT_LoggerEvent__e> events = helper.createLoggerEvent(logger);

    Test.startTest();
    List<Database.SaveResult> results = EventBus.publish(events);
    Test.getEventBus().deliver();
    Test.stopTest();

    for (Database.SaveResult result : results) {
      System.assertEquals(true, result.isSuccess(), 'fetchDebugLogs');
    }
  }
}
