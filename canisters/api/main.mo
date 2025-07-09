persistent actor {
    public query func hello(name: Text) : async Text {
        return "Hello, " # name # "!";
    }
}