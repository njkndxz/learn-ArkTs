import http from '@ohos.net.http';
import { JSON } from '@kit.ArkTS';
import ShopInfo from '../viewModel/ShopInfo';
import axios from '@ohos/axios';


class ShopModal {
  baseUrl: string = 'http://localhost:3000'
  pageNo: number = 1

  getShopListsByAxios(): Promise<ShopInfo[]> {
    return new Promise((resolve, reject) => {
      axios.get(`${this.baseUrl}/shops?pageNo=${this.pageNo}&pageSize=3`)
        .then((res: ESObject) => {
          if (res.status === 200) {
            // 查询成功
            console.log('查询商铺成功！', JSON.stringify(res.data))
            resolve(res.data)
          } else {
            console.log('查询商铺信息失败！error:', JSON.stringify(res))
            reject('查询商铺失败')
          }
        })
        .catch((error: Error) => {
          reject(JSON.stringify(error))
        })
    })
  }

  // getShopLists(): Promise<ShopInfo[]> {
  //   return new Promise((resolve, reject) => {
  //     // 1. 创建http的请求对象，只能使用一次
  //     let httpRequest = http.createHttp()
  //     // 2. 发送请求
  //     httpRequest.request(
  //       `${this.baseUrl}/shops?pageNo=${this.pageNo}&pageSize=3`,
  //       {
  //         method: http.RequestMethod.GET
  //       }
  //     )
  //       .then(res => {
  //         console.log('返回的数据', res.result)
  //         resolve(res.result as ShopInfo[])
  //       })
  //       .catch((error: Error) => {
  //         reject(JSON.stringify(error))
  //       })
  //   })
  // }
}
const shopModel = new ShopModal();
export default shopModel as ShopModal;