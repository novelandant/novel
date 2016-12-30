package prj.novel.note;

public class NoteFactoryCommand {
	private NoteFactoryCommand(){}
	private static NoteFactoryCommand instance = new NoteFactoryCommand();
	
	public static NoteFactoryCommand newInstance() {
		return instance;
	}
	
	public INoteCommand createCommand(String cmd) {
		switch(cmd) {
			case "RECEIVE_MESSAGE_LIST":
				return new ReceiveListCommand();
			case "VIEW_MESSAGE":
				return new ViewCommand();
			case "SEND_MESSAGE_LIST":
				return new SendListCommand();
			case "VIEW_SEND_MESSAGE":
				return new ViewSendCommand();
			case "REPLY_MESSAGE":
				return new ReplyCommand();
			case "SEND_MESSAGE_PROC":
				return new SendProcCommand();
			case "SEND_MESSAGE":
				return new SendCommand();
			case "RECEIVE_MESSAGE_PROC" :
				return new ReceiveListProcCommand();
			case "MESSAGE_PROC" :
				return new MessageProcCommand();

			default:
				return null;
		}
	}
}

