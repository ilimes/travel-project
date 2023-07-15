## 🙌 팀 프로젝트
![logo](https://user-images.githubusercontent.com/95404736/169971400-529c1ca8-2e2d-409a-8c1f-abc30d7aec27.png)

> 5개월 가량 자바 및 스프링 수업을 듣고, 약 5주간 개발하여 만든 첫 팀 프로젝트입니다 :)
<br>

![한빛여행사](https://user-images.githubusercontent.com/95404736/170163886-6676fb63-fe8a-4465-929f-5071c9c7a162.png)

### 팀원소개
- 이대규, 이주영, 안영빈

### 프로젝트 소개
- 한빛여행사는 코로나 확산세가 감소됨에 따라 전국 관광지를 알리자는 취지에서 기획, 제작하였습니다.

### 기능요약
1. 여행상품구매, 여행후기 작성 및 조회, 고객센터, 관리자메뉴 기능이 있습니다.
2. 부가기능으로 날씨정보, 오픈채팅, 추천경로 찾기가 있습니다.

### 개발환경
- Programming Language : <img src="https://img.shields.io/badge/Java-007396?style=for-the-badge&logo=Java&logoColor=white">  <img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=JavaScript&logoColor=white">
- Web Framework : <img src="https://img.shields.io/badge/Spring-6DB33F?style=for-the-badge&logo=Spring&logoColor=white">
- Web Language : <img src="https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=HTML5&logoColor=white"> <img src="https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=CSS3&logoColor=white"> 
- CSS Framework : <img src="https://img.shields.io/badge/Bootstrap-7952B3?style=for-the-badge&logo=Bootstrap&logoColor=white"> 
- Bulid tool : <img src="https://img.shields.io/badge/Apache Maven-C71A36?style=for-the-badge&logo=Apache Maven&logoColor=white"> 
- DataBase : <img src="https://img.shields.io/badge/Oracle-F80000?style=for-the-badge&logo=Oracle&logoColor=white"> 
- DataBase Cloud : Oracle Cloud
- SQL Mapper : MyBatis
- Web Library : jQuery / Ajax / Tiles / Log4j / JSON
- Version Control : <img src="https://img.shields.io/badge/Subversion-809CC9?style=for-the-badge&logo=Subversion&logoColor=white"> 
- Browser : <img src="https://img.shields.io/badge/Google Chrome-4285F4?style=for-the-badge&logo=Google Chrome&logoColor=white"> 
- OS : <img src="https://img.shields.io/badge/Windows-0078D6?style=for-the-badge&logo=Windows&logoColor=white"> 
- IDE : <img src="https://img.shields.io/badge/Spring Tool Suite4-6DB33F?style=for-the-badge&logo=Spring&logoColor=white">

### 담당 파트
- 이대규 - 게시판 기능, 상품 기능, 부가기능, 전체 디자인
- 이주영 - 관리자 기능, 상품 기능, 부가기능
- 안영빈 - 회원 기능, 상품 기능

### 세부기능소개
<details><summary>관리자
</summary>

- #### 상품목록
  <div>등록된 상품의 상품코드, 상품명, 여행기간, 가격을 조회하는 기능입니다.</div>
- #### 상품등록
  <div>상품명, 가격, 여행기간, 지역, 상세주소, 여행지 상세정보, 이미지를 등록하는 기능입니다. </div>
  <div>지도를 클릭하면 해당 위치에 마커가 찍히고 상세주소란에 마커의 주소정보가 입력됩니다.</div>
  <div>주소 검색으로 대략적인 위치를 찾고 마커로 상세위치를 설정할 수 있습니다.</div>
- #### 상품수정
  <div>등록된 상품의 가격과 여행기간 상세정보를 수정할 수 있는 기능입니다.</div>
- #### 상품삭제
  <div>체크박스에 체크된 상품 목록을 삭제하는 기능입니다.</div>
- #### 회원목록
  <div>가입된 전체 회원의 이름, 생년월일, 연락처, 회원가입일을 조회하는 기능입니다.</div>
  <div>이름을 클릭하면 회원의 상세정보를 볼 수 있으며, </div>
  <div>상세정보에는 이름, 생년월일, 성별, 연락처, 주소, 회원등급, 가입일, </div>
  <div>구매 이력과 보유 마일리지를 조회할 수 있습니다.</div>
- #### 탈퇴신청목록
  <div>마이페이지에서 회원탈퇴를 신청한 회원들의 목록을 조회하고</div>
  <div>체크박스에 체크된 회원의 탈퇴를 승인하는 기능입니다.</div>
  <div>탈퇴승인을 하게 되면 회원의 데이터가 삭제됩니다.</div>
- #### 예약관리
  <div>구매된 상품의 예약번호, 패키지명, 예약자, 여행인원, 가격,</div>
  <div>연락처, 예약날짜를 조회할 수 있으며 예약 취소를 할 수 있습니다.</div>
- #### 연월별매출
  <div>당해연도 1월 ~ 12월간의 월간 매출을 확인할 수 있고,</div>
  <div>최근 5년간의 연간 매출을 확인할 수 있습니다.</div>
- #### 상담 및 문의관리
  <div>전체 1:1 문의글을 조회할 수 있고 제목을 클릭하면 문의글의 내용을 볼 수 있으며,</div>
  <div>해당 문의글에 댓글을 작성할 수 있습니다.</div>
  
</details>
<details><summary>회원
</summary>
  
- #### 회원가입 이메일 인증
  <div>입력한 이름, 성별, 생년월일, 이메일을 이메일 중복확인, 이메일 인증을 받은 후 회원가입 페이지로 보내는 기능입니다.</div>
- #### 회원가입 
  <div>이메일 인증 페이지에서 받은 정보와 비밀번호, 주소, 연락처를 추가 입력하여 db에 등록하는 기능입니다.</div>
- #### 로그인
  <div>입력한 아이디, 비밀번호를 db에 조회하여 일치여부, 탈퇴여부를 확인하여 회원정보를 세션에 저장하는 기능입니다.</div>
- #### 아이디 찾기
  <div>입력한 아이디, 성별, 생년월일, 연락처를 db에 조회하여 아이디를 찾는 기능입니다.</div>
- #### 비밀번호 찾기
  <div>입력한 이름, 생년월일, 연락처를 db에 조회하여 찾은 아이디와 입력한 아이디가 일치할 경우 이메일 인증 후 비밀번호를 찾는 기능입니다.</div>
- #### 마이 페이지
  <div>로그인한 회원의 회원 정보와 예약 정보를 조회하는 기능입니다.</div>
- #### 회원 정보 수정
  <div>회원 정보를 수정하고 연락처 중복확인을 한 후 비밀번호를 입력하여 db의 정보를 수정하는 기능입니다.</div>
- #### 비밀번호 변경
  <div>현재 비밀번호와 새 비밀번호를 입력하여 비밀번호를 수정하는 기능입니다.</div>
- #### 회원 탈퇴
  <div>회원 정보를 수정하여 로그인, 아이디 찾기, 비밀번호 찾기를 할 수 없도록 하는 기능입니다.</div>
 
</details>
<details><summary>상품
</summary>

- #### 상품 목록
  <div>상품 목록 페이지에는 현재 예약할 수 있는 상품들이 나타나게 됩니다.</div>
  <div>대표 이미지와 함께 상품 패키지명, 여행설명, 일정, 가격정보 등을 확인할 수 있습니다.</div>
  <div>상단에 있는 검색창 또는 메인 화면에 있는 검색창에서 원하는 상품을 검색할 수도 있습니다.</div>
- #### 상품 상세정보
  <div>상품 상세정보 페이지에는 대표 이미지, 상품 정보, 별점, 여행 설명, 상세 이미지 등이 나타나게 됩니다.</div>
  <div>구매하기 버튼을 누르면 바로 구매 페이지로 이동하고, 장바구니 담기 버튼을 누르면 장바구니에 등록되고 장바구니로 이동할 것인지에 대한 알림창이 나타나게 됩니다.</div>
  <div>단, 로그인이 되지 않은 상태라면 비회원 구매 페이지로 이동할 것인지에 대한 알림이 나타나게 되고 확인 버튼을 누르면 비회원 구매 페이지로 이동하게 됩니다.</div>
  <div>상세이미지는 슬라이드 형식으로 조회할 수 있습니다.</div>
  <div>또한 상품 페이지에서는 여행 위치 정보를 확인할 수 있습니다. 여행 위치 정보는 카카오 지도 API를 사용했습니다.</div>
- #### 상품구매
  <div>상품 구매는 회원 구매와 비회원 구매로 나뉩니다.</div>
  <div>회원 구매의 경우 회원 정보를 받아온 다음 예약자정보에 자동으로 입력하여 별도로 정보를 입력할 필요 없이 바로 결제할 수 있게 만들었습니다.</div>
  <div>비회원 구매를 하게 되는 경우에는 예약자 정보를 별도로 입력해야합니다.</div>
  <div>상품정보 및 예약자정보를 확인한 다음 주문서 내역 확인 및 개인정보 제공 동의에 체크해야 결제 페이지로 이동할 수 있습니다.</div>
  <div>결제 시스템은 아임포트 결제 API를 이용했으며, 실제로 결제가 이루어져야 데이터베이스에 결제 정보가 저장됩니다.</div>
  <div>결제에 성공하면 패키지 구매 완료 페이지로 이동되며,</div>
  <div>만약 중간에 결제를 취소하는 등 여러가지 이유로 결제에 실패하게 되면, 실패 페이지로 이동되며 사유도 함께 나타나게 됩니다.</div>
- #### 찜 목록 (장바구니)
  <div>찜 목록에는 구매를 원하는 상품을 담아놓을 수 있는 기능입니다. 찜 목록에 상품을 담아 놓고 원하는 상품만 골라서 선택구매를 하거나 전체구매를 할 수 있습니다.</div>
 
</details>
<details><summary>게시판
</summary>

- #### 공지사항
  <div>공지사항은 관리자만 작성할 수 있습니다.</div>
  <div>글을 작성할 때 메인글 여부를 체크할 수 있고, 메인글이라면 게시판 상단에 공지가 고정됩니다.</div>
  <div>또한 메인글로 등록한 공지사항은 홈페이지 최상단의 롤링 공지사항으로도 나타나게 됩니다.</div>
- #### 1:1 문의
  <div>1:1 문의 게시판은 로그인 한 회원만 이용할 수 있습니다.</div>
  <div>문의 게시글을 올리면 관리자 메뉴에서 답변할 수 있고, 답변이 하나이상 달린 경우 추가의견을 등록할 수 있습니다.</div>
- #### 여행 후기
  <div>여행 후기는 본인이 구매한 여행상품에 대해서만 작성할 수 있도록 만들었습니다.</div>
  <div>후기를 작성할 때는 1점부터 5점까지 별점을 줄 수 있고, 등록한 별점은 상품목록에 반영됩니다.</div>
  <div>추천 기능이 있어서 마음에 드는 후기라면 추천할 수 있습니다. 추천은 로그인 한 회원만 할 수 있습니다.</div>
  <div>추천 정보는 데이터베이스에 저장되기 때문에 추천한 게시글에 한번 더 추천 버튼을 누르면 추천이 취소됩니다.</div>
  <div>하단의 검색란에서 제목, 내용, 작성자 키워드로 후기 검색 또한 가능합니다.</div>
- #### 베스트 후기
  <div>후기의 추천수를 기준으로 상위 10개의 항목만 나타내는 게시판입니다.</div>
- ##### 모든 게시판의 글쓰기 기능은 ck에디터를 적용하였고, 이미지 첨부를 할 수 있으며 페이징 처리가 되어 있습니다.</div>
  
</details>
<details><summary>부가기능
</summary>

- #### 날씨정보
  <div>날씨 정보 기능은 OpenWeatherMap API로 구현하였습니다.</div>
  <div>또한 Geolocation API로 사용자의 현재 위치를 확인하며, 해당 지역의 날씨 정보를 나타냅니다.</div>
- #### 오픈채팅
  <div>오픈채팅 기능은 웹소켓을 사용했습니다.</div>
  <div>닉네임 입력 후 오픈채팅에 입장할 수 있고, 닉네을 입력하지 않으면 modal 알림창이 나타나게 됩니다.</div>
  <div>사용자가 입력한 채팅과 함께 입장알림, 퇴장알림 등이 채팅에 나타나게 되며 원한다면 대화내용을 지울 수도 있습니다.</div>
- #### 추천경로
  <div>키워드를 입력하고 검색버튼을 누른 뒤,</div>
  <div>장소를 여러 곳 선택하고 찾기 버튼을 누르면 추천경로를 찾아줍니다.</div>
 
</details>
