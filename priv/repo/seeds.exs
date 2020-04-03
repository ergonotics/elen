# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Elen.Repo.insert!(%Elen.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Elen.Auth.User
alias Elen.Chat.Conversation
alias Elen.{Auth, Chat}

{:ok, %User{id: u1_id} = user1} =
  Auth.create_user(%{
    email: "bernard@lnf.be",
    password: "p@55w0rd",
    confirm_password: "p@55w0rd",
    nickname: "bernard"
  })

{:ok, %User{id: u2_id} = user2} =
  Auth.create_user(%{
    email: "francois@lnf.be",
    password: "eeeeeeee",
    confirm_password: "eeeeeeee",
    nickname: "francois"
  })

{:ok, %Conversation{id: conv_id} = conversation} =
  Chat.create_conversation(%{
    title: "ELEN",
    conversation_members: [%{user_id: u1_id, owner: true}, %{user_id: u2_id, owner: false}]
  })

IO.puts("Created records:")
IO.inspect(user1)
IO.inspect(user2)
IO.inspect(conversation)
