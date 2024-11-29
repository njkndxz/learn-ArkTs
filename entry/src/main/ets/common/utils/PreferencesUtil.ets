import preferences from '@ohos.data.preferences';

class PreferencesUtil {

  prefMap: Map<string, preferences.Preferences> = new Map()


  async loadPreference(context: Context, name: string) {
    try {
      // 加载preferences
      const pref = await preferences.getPreferences(context, name)
      this.prefMap.set(name, pref)
      console.debug('加载成功')
    } catch (e) {
      console.debug('加载失败')
    }
  }

  async putPreferenceValue(name: string, key: string, value: preferences.ValueType) {
    try {
      if(this.prefMap.has(name)) {
        const pref = this.prefMap.get(name)
        // 写入数据
        await pref?.put(key, value)
        // 刷新
        await pref?.flush()
        console.debug('保存数据成功')
      }else {
        console.error('没有这个' + name)
      }
    } catch (e) {
    }
  }
  // defaultValue是默认数据
  async getPreferenceValue(name: string, key: string, defaultValue: preferences.ValueType) {
    try {
      if(this.prefMap.has(name)) {
        const pref = this.prefMap.get(name)
        // 读取数据
        let value = await pref?.get(key, defaultValue)
        console.debug('读取数据成功')
        return value?.toString()
      }else {
        console.error('没有这个' + name)
        return null
      }
    } catch (e) {
      console.error('读取数据失败')
      return null
    }
  }

}

const preferencesUtil = new PreferencesUtil()

export default preferencesUtil as PreferencesUtil