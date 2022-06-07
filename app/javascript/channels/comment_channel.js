import consumer from "./consumer"

if(location.pathname.match(/\/worries\/\d/)){

  consumer.subscriptions.create({
    channel: "CommentChannel",
    worry_id: location.pathname.match(/\d+/)[0]
  }, {

  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `
    <div class="comment">
      <p class="user-info">${data.user.nickname}： </p>
      <p>${data.comment.answer}</p>
    </div>`
  const comments = document.getElementById("comments")
  comments.insertAdjacentHTML('beforeend', html)
  const commentForm = document.getElementById("comment-form")
  commentForm.reset();
    // Called when there's incoming data on the websocket for this channel
  }
});
}