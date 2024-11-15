

@Entry
@Component
struct Index {
  // @State message: string = 'Hello World123';

  build() {
    // build里面只能有一个容器组件
    // 使用space控制组件间的距离
    Column({ space: 20 }) {
      Image($r('app.media.startIcon'))
        .width(50)
      TextInput({
        placeholder: '请输入用户名'
      })
      TextInput({
        placeholder: '请输入密码'
      })
        .type(InputType.Password)
      Button('登录')
        .width('100%')
      Row({ space: 20 }) {
        Text('前往注册')
        Text('忘记密码')
      }
    }
    .padding(20)
  }
}