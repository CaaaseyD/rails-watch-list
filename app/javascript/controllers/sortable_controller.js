import { Controller } from "@hotwired/stimulus"
import { rawListeners } from "process"
import Sortable from "sortablejs"
// yarn add sortablejs
export default class extends Controller {
  connect() {
    console.log("sortable connected")
    this.sortable = Sortable.create(this.element, {
      onEnd: this.end.bind(this)
    })
  }
  end(event){
    let id = event.item.dataset.id
    let newp = event.newIndex + 1
    console.log(id)
    console.log(newp)
  }
}

// Rail.ajax({
//   url: this.data.get("url").replace(":id", id),
//   type: 'PATCH',
//   data: data
// })
