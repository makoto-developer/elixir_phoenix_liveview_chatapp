# ChatApp

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

## Work


```shell
mix phx.new chat_app --live
mv chat_app elixir_phoenix_liveview_chatapp
cd elixir_phoenix_liveview_chatapp
mix deps.get
source .env
mix ecto.create
mix phx.gen.context Chat RoomCategories category name:string parent_id:id
mix phx.gen.context Chat Rooms room name:string category:references:RoomCategories visibility:boolean creator_name:string
mix phx.gen.context Chat Users user name:string email:string ip_address:string
mix phx.gen.context Chat Messages message room_id:references:rooms user_name:string body:text
```

## TODO

- [ ] アカウントを作る
- [ ] 短い単語の時は、横幅を短く表示する(現在は2/3で固定で表示。なんかダサい)
- [ ] パンくずリストを表示
- [ ] メッセージを永続化
- [ ] メンション機能
- [ ] アクティブなアカウントか分かるようにする
- [ ] ユーザの詳細ページを作る
- [ ] 負荷テスト