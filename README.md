# Godot 2D game

This is very simple 2d platformer game in godot for revision purposes

## Add SSL certificate to http-server
```
openssl req -newkey rsa:2048 -new -nodes -x509 -days 3650 -keyout cert/key.pem -out cert/cert.pem
http-server dist -S -C cert/cert.pem -K cert/key.pem -o
```