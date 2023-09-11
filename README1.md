20230911_BoardProject
Board Project
1. 프로젝트 기본 정보
   a. project name: board_20230911
   b. package: com.icia.board
2. Class
   a. controller
   i. HomeController
   ii. BoardController
   iii. CommentController
   b. service
   i. BoardService
   ii. CommentService
   c. repository
   i. BoardRepository
   ii. CommentRepository
   d. dto
   i. BoardDTO
   ii. BoardFileDTO
   iii. CommentDTO
   iv. PageDTO
   e. mapper
   i. board-mapper
   ii. comment-mapper
3. jsp
   a. index.jsp: 시작페이지(글작성, 목록출력을 위한 링크 있음)
   b. boardSave.jsp: 글작성 페이지
   20230911_BoardProject 2
   i. 글 작성 정보: 작성자(boardWriter), 글비밀번호(boardPass), 제목(boardTitle), 내
   용(boardContents)
   c. boardList.jsp: 글목록 페이지
   d. boardDetail.jsp: 글조회 페이지
   e. boardUpdate.jsp: 글수정 페이지
   f. deleteCheck.jsp: 삭제시 비밀번호 체크용 페이지
4. urls
   주소값 http method 역할 파라미터
   처리 후 결과 페이
   지
   / get 시작페이지 - index.jsp
   /board/save get
   글작성 페이지 출
   력
- boardSave.jsp
  /board/save post 글작성 BoardDTO boardList.jsp
  /board/ get 글목록 출력 - boardList.jsp
  /board get 상세조회 id boardDetail.jsp
  /board/delete get 글삭제 id boardList.jsp
  /board/update get 수정화면 출력 id boardUpdate.jsp
  /board/update post 수정처리 BoardDTO boardDetail.jsp
  /board/search get 검색 searchType, q boardList.jsp
  /board/paging get 페이징처리 page boardPaging.jsp
  /comment/save post 댓글작성 CommentDTO
5. table
   a. table name: board_table
   i. id(pk): bigint, auto_increment
   ii. boardWriter: varchar(50)
   iii. boardPass: varchar(20)
   iv. boardTitle: varchar(50)
   v. boardContents: varchar(500)
   vi. createdAt: datetime
1. BoardDTO에서는 String 타입으로 정의함
   vii. boardHits: int
   20230911_BoardProject 3
1. 기본값 0으로
   viii. fileAttached: int
1. 파일첨부 여부를 위한 컬럼(해당게시글에 첨부파일이 있으면 1, 없으면 0)
2. 기본값 0으로
   b. table name: board_file_table
   i. id(pk): bigint, auto_increment
   ii. originalFileName: varchar(100) (원본파일이름)
   iii. storedFileName: varchar(100) (저장용파일이름)
   iv. boardId: bigint
1. board_table의 id 참조
6. 게시글 수정
   a. 글조회 화면에서 수정 버튼 클릭하면 수정 페이지 출력됨
   b. 수정은 제목, 내용만 가능
   c. 비밀번호를 입력하여 일치하면 수정처리, 일치하지 않으면 비밀번호 일치하지 않는다는
   alert 출력
   d. 수정 완료 후 글조회 화면 출력
   i. 수정 내용이 반영되어 있어야 함.
7. 게시글 삭제
   a. 글조회 화면에서 삭제 버튼 클릭하면 비밀번호 확인 페이지(deleteCheck.jsp)출력
   b. 비밀번호 입력 후 일치하면 삭제 처리, 일치하지 않으면 비밀번호 일치하지 않는다는
   alert 출력
   c. 삭제 완료 후 글목록 출력
   20230911_BoardProject 4
8. 댓글처리
   a. 댓글작성은 boardDetail.jsp 게시글 상세내용 하단에서 제목, 내용 입력
   b. 댓글작성 버튼 클릭하면 commentWrite() 함수 호출
   c. commentWrite 함수는 ajax 로 /comment/save 주소로 댓글작성자, 댓글내용, 글번호
   를 post 방식으로 보냄.
   i. CommentDTO 클래스
   public class CommentDTO {
   private Long id;
   private String commentWriter;
   private commentContents;
   private Long boardId;
   private Timestamp commentCreatedDate;
   }
   d. CommentService → CommentRepository → comment-mapper를 거쳐서
   comment_table에 저장처리
   e. comment_table은 CommentDTO를 참고하여 만들어볼 것
   i. foreign key도 적용해야 함.
   f. 댓글은 게시글 상세조회시 해당 댓글 목록도 함께 가져가서 화면에 보여줘야 함
   i. 작성된 댓글이 없다면 댓글목록 출력 부분에 “아직 작성된 댓글이 없습니다.”로 출력