package mybatis;

//방명록 게시판인 myboard 테이블의 레코드를 저장할 DTO객체
public class MyBoardDTO {

	private int idx;
	private String id;
	private String name;
	private String contents;
	
	//생성자 없이 getter/setter만 생성
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	
	
}
