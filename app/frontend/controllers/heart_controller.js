// Visit The Stimulus Handbook for more details 
// https://stimulusjs.org/handbook/introduction
// 
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"
import axios from "axios"

export default class extends Controller {
  static targets = [ "heart" ]
  
  favorite() {
    const token = document.querySelector("meta[name=csrf-token]").content
    axios.defaults.headers.common['X-CSRF-Token'] = token;

    let board_id = this.data.get("boardId")
    axios.post(`/boards/${board_id}/favorite.json`)
         .then((result) => { // => 沒有自己的this，所以不會被蓋過
           if (result.data["status"] == true) {
             this.heartTarget.classList.remove("far")
             this.heartTarget.classList.add("fas")
           } else {
             this.heartTarget.classList.remove("fas")
             this.heartTarget.classList.add("far")
           }
         })
         .catch(function(err){
           console.log(err)
         })
  }
//   connect() { 確定掛載上去後就可以刪掉
//     console.log('hi')
//   }
 }
