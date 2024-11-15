import InfoItem from './InfoItem'
import { CommentData } from '../modal/CommentData'

@Component
struct InfoContent {
  @Prop commentList: CommentData[]

  // 点赞
  handleLike(index: number) {
    let itemData = this.commentList[index]
    if(itemData.isLike) {
      itemData.likeNum--
    } else {
      itemData.likeNum++
    }
    itemData.isLike = !itemData.isLike
    // 因为会将这整个数据进行更新，会带来闪烁效果，所以要用@Observed和@ObjectLink进行数据深层双向绑定
    // this.commentList.splice(index, 1, itemData)
  }

  build() {
    // 列表组件
    List() {
      ForEach(this.commentList, (item: CommentData, index: number) => {
        InfoItem({
          itemObj: item,
          handleLike: (): void => this.handleLike(index)
        })
      })
    }
    .width('100%')
    .layoutWeight(1)
    .padding({
      bottom: 10
    })
    .scrollBar(BarState.Off)
    // .divider({
    //   strokeWidth: 1, //线宽
    //   color: '#e6e6e6', // 颜色
    //   startMargin: 10, // 左边间隙
    //   endMargin: 10 // 右边间隙
    // })
  }
}

export default InfoContent