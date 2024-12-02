import { relationalStore, ValuesBucket } from '@kit.ArkData'


interface Config {
  name: string;
  securityLevel: relationalStore.SecurityLevel;
}

export class RdbStoreUtil {

  private  rdbStore: relationalStore.RdbStore | null = null
  private dbName: string = 'MyApplication.db'
  private init_sql: string = ''


  constructor(dbName: string, init_sql: string) {
    this.dbName = dbName
    this.init_sql = init_sql
  }

  /*
   * 初始化数据库
   * @params (Context) context
   * */
  initDB(context: Context) {
    // 1. 配置rdb
    const config: Config = {
      name: this.dbName,
      securityLevel: relationalStore.SecurityLevel.S1 // 数据库安全级别
    }
    // 2. 获取rdb，init_sql是初始化sql语句，可以从外部传入
    relationalStore.getRdbStore(context, config, (err, rdbStore) => {
      if(err) {
        console.error('获取rdbStore失败')
        return
      }
      // 执行sql
      rdbStore.executeSql(this.init_sql)
      // 保存rdbStore
      this.rdbStore = rdbStore
    })
  }

  /*
   * 查询
   * @params (string) tableName
   * @params (string[]) columns
   * @return result 查询结果
   * */
  async getValues(tableName: string, columns: string[]) {
    //1.构建查询条件
    const predicates = new relationalStore.RdbPredicates(tableName)
    //2.查询
    const result = await this.rdbStore?.query(predicates, columns)
    return result
  }

  /*
   * 新增
   * @return id
   * */
  addValue(tableName: string, data: ValuesBucket) {
    return this.rdbStore?.insert(tableName, data)
  }

  /*
   * 更新
   * @params (string) tableName
   * @params (number) id
   * @params (ValuesBucket) data
   * */
  updateValue(tableName: string, id: number, data: ValuesBucket) {
    //1.构建更新条件
    const predicates = new relationalStore.RdbPredicates(tableName)
    //2.对比id是否相等
    predicates.equalTo('ID', id)
    //3.更新操作
    return this.rdbStore?.update(data, predicates)
  }

  /*
   * 删除
   * @params (number) id
   * */
  deleteById(tableName: string, id: number) {
    // 1.删除的条件
    const predicates = new relationalStore.RdbPredicates(tableName)
    //2.对比id是否相等
    predicates.equalTo('ID', id)
    //3.删除操作
    return this.rdbStore?.delete(predicates)
  }

  /*
     * 删除数据库
     * @params (Context) context
     * @params (string) dbName
     * */
  deleteDB(context: Context, dbName: string) {
    relationalStore.deleteRdbStore(context, dbName, (err) => {
        if(err) {
          console.error('删除数据存储失败')
          return
        }
        console.debug('删除数据存储成功')
    })
  }

}
