package com.github.weixin.demo.domain;

public class WebSocketBean {
    //{"message":"hello: 莫言","role":"NDEV003","socketId":"123"}
    String message;
    String role;
    String socketId;

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getSocketId() {
        return socketId;
    }

    public void setSocketId(String socketId) {
        this.socketId = socketId;
    }
}
