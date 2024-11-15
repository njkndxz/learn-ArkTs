
interface Person {
  name: string
  age: number
}


@Component
struct Son {


  build() {
    Column() {
      Text('我是子组件')
      Sun()
    }
  }
}

@Component
struct Sun {
  @Consume themeColor: string
  @Consume person: Person


  build() {
    Column() {
      Text('我是孙子组件')
      Text(this.themeColor)
      Text(JSON.stringify(this.person))
      Button('修改数据')
        .onClick(() => {
          this.themeColor = '#fff'
          this.person.age++
        })
    }
  }
}

@Entry
@Component
struct Index {

  // @Provide和@Consume搭配可以跨组件进行双向绑定
  @Provide themeColor: string = '#2c2c2c'
  @Provide person: Person = {
    name: 'aa',
    age: 12
  }

  build() {
    Column() {
      Text('我是父组件')
      Button('修改数据')
        .onClick(() => {
          this.themeColor = '#fff'
          this.person.age++
        })
      Son()
    }
  }
}