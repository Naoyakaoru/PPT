import consumer from "./consumer"
const chatChannel = consumer.subscriptions.create(
  { channel: "ChatChannel", room: "Best Room" },
  { connected() {
    console.log('Connected!')
    },
    
    received(data) {
    console.log(data)
    }
  }
)
// consumer.subscriptions.create({ channel: "ChatChannel", room: "1st Room" },
//   { received(data) {
//     console.log(data)
//     }
//   }
// )

// consumer.subscriptions.create({ channel: "ChatChannel", room: "2nd Room" },
//   { received(data) {
//     console.log(data)
//     }
//   }
// )

chatChannel.send({ sent_by: "Paul", body: "This is a cool chat app." })