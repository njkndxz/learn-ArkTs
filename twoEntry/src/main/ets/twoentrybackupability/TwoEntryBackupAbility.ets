import { hilog } from '@kit.PerformanceAnalysisKit';
import { BackupExtensionAbility, BundleVersion } from '@kit.CoreFileKit';

export default class TwoEntryBackupAbility extends BackupExtensionAbility {
  async onBackup() {
    hilog.info(0x0000, 'testTag', 'onBackup ok');
  }

  async onRestore(bundleVersion: BundleVersion) {
    hilog.info(0x0000, 'testTag', 'onRestore ok %{public}s', JSON.stringify(bundleVersion));
  }
}