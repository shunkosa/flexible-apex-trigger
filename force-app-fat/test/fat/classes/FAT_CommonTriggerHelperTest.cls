/**
 * @name FAT_CommonTriggerHelperTest.cls
 * @description test class for FAT_CommonTriggerHelper
 */
@isTest(SeeAllData=false)
private class FAT_CommonTriggerHelperTest {
  private static FAT_ITriggerObserver triggerObserverMock = (FAT_ITriggerObserver) FAT_CommonTriggerServiceMock.class
    .newInstance();

  private static FAT_CommonTriggerHelper helper = FAT_CommonTriggerHelper.getInstance();

  @isTest
  static void addTriggerObserversNull() {
    Test.startTest();
    helper.addTriggerObservers(null);
    Test.stopTest();

    System.assertNotEquals(null, helper, 'addTriggerObserversNull');
  }

  @isTest
  static void addTriggerObserver() {
    FAT_TriggerObserver__mdt triggerObserver = FAT_CommonTestUtils.selectTriggerServiceMock();

    Test.startTest();
    helper.addTriggerObserver(triggerObserver);
    Test.stopTest();

    System.assertEquals(
      'FAT_CommonTriggerServiceMock',
      triggerObserver.ApexClass__c,
      'addTriggerObserver'
    );
  }

  @isTest
  static void addTriggerObserverNull() {
    FAT_TriggerObserver__mdt triggerObserver = null;
    FAT_TriggerObserver__mdt triggerObserverApexClass = new FAT_TriggerObserver__mdt();
    triggerObserverApexClass.ApexClass__c = null;

    Test.startTest();
    helper.addTriggerObserver(triggerObserver);
    helper.addTriggerObserver(triggerObserverApexClass);
    Test.stopTest();

    System.assertEquals(null, triggerObserver, 'addTriggerObserverNull');
  }

  @isTest
  static void addTriggerObserverApexClassNull() {
    FAT_TriggerObserver__mdt triggerObserver = new FAT_TriggerObserver__mdt();
    triggerObserver.ApexClass__c = 'FAT_Temp';

    Test.startTest();
    helper.addTriggerObserver(triggerObserver);
    Test.stopTest();

    System.assertEquals(
      'FAT_Temp',
      triggerObserver.ApexClass__c,
      'addTriggerObserverApexClassNull'
    );
  }

  @isTest
  static void addObserverBeforeInsert() {
    TriggerOperation triggerOperation = TriggerOperation.BEFORE_INSERT;

    Test.startTest();
    helper.addObserver(triggerOperation, triggerObserverMock);
    Test.stopTest();

    System.assertEquals(
      1,
      helper.beforeInserts.size(),
      'addObserverBeforeInsert'
    );
  }

  @isTest
  static void addObserverBeforeUpdate() {
    TriggerOperation triggerOperation = TriggerOperation.BEFORE_UPDATE;

    Test.startTest();
    helper.addObserver(triggerOperation, triggerObserverMock);
    Test.stopTest();

    System.assertEquals(
      1,
      helper.beforeUpdates.size(),
      'addObserverBeforeUpdate'
    );
  }

  @isTest
  static void addObserverBeforeDelete() {
    TriggerOperation triggerOperation = TriggerOperation.BEFORE_DELETE;

    Test.startTest();
    helper.addObserver(triggerOperation, triggerObserverMock);
    Test.stopTest();

    System.assertEquals(
      1,
      helper.beforeDeletes.size(),
      'addObserverBeforeDelete'
    );
  }

  @isTest
  static void addObserverAfterInsert() {
    TriggerOperation triggerOperation = TriggerOperation.AFTER_INSERT;

    Test.startTest();
    helper.addObserver(triggerOperation, triggerObserverMock);
    Test.stopTest();

    System.assertEquals(
      1,
      helper.afterInserts.size(),
      'addObserverAfterInsert'
    );
  }

  @isTest
  static void addObserverAfterUpdate() {
    TriggerOperation triggerOperation = TriggerOperation.AFTER_UPDATE;

    Test.startTest();
    helper.addObserver(triggerOperation, triggerObserverMock);
    Test.stopTest();

    System.assertEquals(
      1,
      helper.afterUpdates.size(),
      'addObserverAfterUpdate'
    );
  }

  @isTest
  static void addObserverAfterDelete() {
    TriggerOperation triggerOperation = TriggerOperation.AFTER_DELETE;

    Test.startTest();
    helper.addObserver(triggerOperation, triggerObserverMock);
    Test.stopTest();

    System.assertEquals(
      1,
      helper.afterDeletes.size(),
      'addObserverAfterDelete'
    );
  }

  @isTest
  static void addObserverAfterUndelete() {
    TriggerOperation triggerOperation = TriggerOperation.AFTER_UNDELETE;

    Test.startTest();
    helper.addObserver(triggerOperation, triggerObserverMock);
    Test.stopTest();

    System.assertEquals(
      1,
      helper.afterUndeletes.size(),
      'addObserverAfterUndelete'
    );
  }

  @isTest
  static void addObserverNull() {
    Test.startTest();
    helper.addObserver(null, null);
    Test.stopTest();

    System.assertNotEquals(null, helper, 'addObserverNull');
  }

  @isTest
  static void fetchTriggerObserverClass() {
    Test.startTest();
    FAT_ITriggerObserver observer = helper.fetchTriggerObserverClass(
      FAT_CommonTriggerServiceMock.class
    );
    Test.stopTest();

    System.assertNotEquals(null, observer, 'fetchTriggerObserverClass');
  }

  @isTest
  static void fetchTriggerObserverClassNull() {
    Test.startTest();
    FAT_ITriggerObserver observer = helper.fetchTriggerObserverClass(null);
    Test.stopTest();

    System.assertEquals(null, observer, 'fetchTriggerObserverClassNull');
  }

  @isTest
  static void fetchActiveTriggerOperations() {
    FAT_TriggerObserver__mdt triggerObserver = FAT_CommonTestUtils.selectTriggerServiceMock();

    List<TriggerOperation> allTriggerOperations = new List<TriggerOperation>();
    allTriggerOperations.add(TriggerOperation.BEFORE_INSERT);
    allTriggerOperations.add(TriggerOperation.BEFORE_UPDATE);
    allTriggerOperations.add(TriggerOperation.BEFORE_DELETE);
    allTriggerOperations.add(TriggerOperation.AFTER_INSERT);
    allTriggerOperations.add(TriggerOperation.AFTER_UPDATE);
    allTriggerOperations.add(TriggerOperation.AFTER_DELETE);
    allTriggerOperations.add(TriggerOperation.AFTER_UNDELETE);

    Test.startTest();
    List<TriggerOperation> operations = helper.fetchActiveTriggerOperations(
      triggerObserver
    );
    Test.stopTest();

    System.assertEquals(
      allTriggerOperations,
      operations,
      'addActiveTriggerOperations'
    );
  }

  @isTest
  static void addActiveTriggerOperationsInactive() {
    FAT_TriggerObserver__mdt triggerObserver = new FAT_TriggerObserver__mdt();
    triggerObserver.Active__c = false;

    Test.startTest();
    List<TriggerOperation> operations = helper.fetchActiveTriggerOperations(
      triggerObserver
    );
    Test.stopTest();

    System.assertEquals(
      new List<TriggerOperation>(),
      operations,
      'addActiveTriggerOperationsInactive'
    );
  }
}
