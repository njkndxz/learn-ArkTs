
interface Person {
  name: string
  age: number
}


@Component
struct Son {
  // @Link双向绑定
  @Link count: number
  @Link person: Person


  build() {
    Column() {
      Text('我是子组件')
      Text(JSON.stringify(this.person))
      Button('修改数据').onClick(() => {
        this.count++
        this.person.age++
      })
    }
  }
}


@Entry
@Component
struct Index {
  @State count: number = 0
  @State person: Person = {
    name: 'aa',
    age: 12
  }
  build() {
    Column() {
      Text('我是父组件')
      Text(JSON.stringify(this.person))
      Button('修改数据').onClick(() => {
        this.count++
        this.person.age++
      })
      Son({
        count: this.count,
        person: this.person
      })
    }
  }
}