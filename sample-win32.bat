@echo off

setlocal

rem Webhook URL
set URL=https://oapi.dingtalk.com/robot/send?access_token=xxxx

rem メッセージ (改行は\n)
set TEXT="ようこそ %USERNAME% さん.\nこれはcurlを使ったコマンドラインからdingtalkへの送信テストです。"


rem 送信
echo {'msgtype':'text','text':{'content':%TEXT%}}| nkf -w  > test.json
curl -i -X POST %URL% -H "Content-Type: application/json; charset=utf-8" -d @test.json 
