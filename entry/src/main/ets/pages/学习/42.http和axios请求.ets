import ShopModal from '../../model/ShopModal'
import ShopInfo from '../../viewModel/ShopInfo'


@Entry
@Component
struct Index {
  @State shops: ShopInfo[] = []
  isLoading: boolean = false
  isMore: boolean = true

  aboutToAppear(): void {
    this.loadShopInfo()
  }

  loadShopInfo(){
    // 加载数据
    ShopModal.getShopListsByAxios()
      .then(shops => {
        console.log('接受到的数据', JSON.stringify(shops))
        // 给图片加上服务器地址前缀
        shops.forEach(s => {
          s.images.forEach((src, i) => {
            s.images[i] = 'http://localhost:3000' + src
          })
        })

        this.shops = this.shops.concat(shops)
        this.isLoading = false
        if(!shops || shops.length === 0){
          this.isMore = false
        }
      })
  }

  build() {
    Column({ space: 10 }) {

      List({ space: 10 }) {
        ForEach(this.shops, (shop: ShopInfo) => {
          ListItem() {
            Column() {

            }
          }
        })
      }
      .width('100%')
      .layoutWeight(1)
      .onReachEnd(() => {
        console.log('触底了！')
        if(!this.isLoading && this.isMore){
          this.isLoading = true
          // 翻页
          ShopModal.pageNo++
          this.loadShopInfo()
        }
      })

    }
    .width('100%')
    .height('100%')
    .padding(10)
    .backgroundColor('#e1e2e3')
  }
}