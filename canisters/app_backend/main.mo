import LLM "mo:llm";

persistent actor {

  public func prompt(prompt: Text) : async Text {
    await LLM.prompt(#Llama4Scout, prompt);
  };

  public func chat(messages: [LLM.ChatMessage]): async Text {
    let response = await LLM.chat(#Llama4Scout).withMessages(messages).send();

    switch (response.message.content) {
      case (?text) text;
      case null "";
    };
  };
}

