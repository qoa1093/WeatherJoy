package weather.joy.service;


import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import weather.joy.domain.Criteria;
import weather.joy.domain.MemberVO;
import weather.joy.domain.SocialVO;
import weather.joy.mapper.MemberMapper;



@Service
@AllArgsConstructor
@Log4j
public class MemberServiceImp implements MemberService{
	private MemberMapper mapper;
	
	@Override
	public List<MemberVO> getUserList(){
		
		return mapper.getUserList();
	}
	@Override
	public List<MemberVO> getList(Criteria cri){
		return mapper.getListWithPaging(cri);
	}
	
	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}
	
	@Override
	public String register(MemberVO user) { 
		log.info("register......"+user);
		mapper.insertUserNum(user);
		log.info(user.getMemNum());
		mapper.insertUser(user);
		 
		String i = user.getMemId(); 
		return i;
	}
	@Override
	public MemberVO getRead(String userid){
		log.info("getList.....");
		return mapper.read(userid);
	}
	
	@Override
	public int modify(MemberVO user) { 
		log.info("modify......"+user);
		
		 //MemberVO user1 = mapper.read(user);
		return mapper.update(user);
	}
	//id로 삭제할지 memNum으로 삭제할지 고려해볼것 
	@Override
	public int delete(long memNum) { 
		log.info("remove......"+memNum);
		
		return mapper.delete(memNum);
	}
	@Override
	public MemberVO getMemId(String memId) {
		if(memId == null)
			return null;
		return mapper.selectMemberId(memId);
	}
	//카카오 로그인 토큰 가져와서 사용자 정보 확인하기
	@Override
	public SocialVO getSocialData(String code) {
		
		String token = getAccessToken(code);
		
		log.info("토큰값 : "+token);
		SocialVO kakao = getUserInfo(token);
		log.info("kakao유저정보:"+kakao);
		
		
		return kakao;
	}
	
	public SocialVO getUserInfo(String token) {
		SocialVO userInfo = new SocialVO();
		log.info("유저의 액세스토큰"+token);
		
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");

			// 요청에 필요한 Header에 포함될 내용
			conn.setRequestProperty("Authorization", "Bearer " + token);

			int responseCode = conn.getResponseCode();
			log.info("responseCode : " + responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			log.info("response body : " + result);

			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);

			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

			String email = kakao_account.getAsJsonObject().get("email").getAsString();
			log.info("email-------------:"+email);
			String id = element.getAsJsonObject().get("id").getAsString();
			SocialVO socialUser = mapper.getSocial(email, "K");
			//log.info(socialUser.getSoEmail());
			//user_wj의 정보를 모두 불러오고 그중 이메일정보를 불러와서 해당 이메일이 존재하면 기존회원 리턴
				//이부분 수정해야 할 것. false가 나오는 이유가?
			  if(socialUser!=null&& email.equals(socialUser.getSoEmail())) { 
				  userInfo = socialUser; 
			  } //기존회원이 없는 상태라면 새로 가입하게끔 함 
			  else { 
		      MemberVO user = new MemberVO(); mapper.insertUserNum(user); 
			  userInfo.setMemNum(user.getMemNum());
			  userInfo.setSoEmail(email); 
			  userInfo.setSnsType("K"); 
			  userInfo.setSoId(id);
			  userInfo.setSoToken(token);
			  //소셜가입 완료
				mapper.insertSocialUser(userInfo);
			  }
			 
		} catch (IOException e) {
			e.printStackTrace();
		}
		return userInfo;
	}
	
	public String getAccessToken(String code) {
        String access_Token = "";
       String refresh_Token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";

        try {
            URL url = new URL(reqURL);

            HttpURLConnection conn = (HttpURLConnection)url.openConnection();

            //  URL연결은 입출력에 사용 될 수 있고, POST 혹은 PUT 요청을 하려면 setDoOutput을 true로 설정해야함.
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);

            //	POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=6073737f8366fc357c74398f62c53fad");  //본인이 발급받은 key
            sb.append("&redirect_uri=http://127.0.0.1:8080/oauth/kakao");     // 본인이 설정해 놓은 경로
            sb.append("&code=" +code);
            bw.write(sb.toString());
            bw.flush();

            //    결과 코드가 200이라면 성공
            int responseCode = conn.getResponseCode();
        	log.info("responseCode : " + responseCode);

            //    요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
        	log.info("response body : " + result);

            //    Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            access_Token = element.getAsJsonObject().get("access_token").getAsString();
            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

        	log.info("access_token : " + access_Token);
        	log.info("refresh_token : " + refresh_Token);

            br.close();
            bw.close();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return access_Token;
        
    }
}
