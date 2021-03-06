package com.honeyjam.reservation.service;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.ws.FaultAction;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.honeyjam.reservation.dao.ReservationDao;
import com.honeyjam.reservation.dao.ReservationDaoImpl;
import com.honeyjam.room.dao.RoomDao;
import com.honeyjam.room.dao.RoomDaoImpl;
import com.honeyjam.room.service.RoomServiceImpl;
import com.honeyjam.util.SqlSessionFactoryManager;
import com.honeyjam.vo.Reservation;
import com.honeyjam.vo.Room;

public class ReservationServiceImpl implements ReservationService{

	private static ReservationServiceImpl instance;

	private SqlSessionFactory factory;
	private ReservationDao dao;

	private ReservationServiceImpl() throws IOException{
		factory = SqlSessionFactoryManager.getInstance().getSqlSessionFactory();
		dao = ReservationDaoImpl.getInstance();
	}

	public static ReservationServiceImpl getInstance() throws IOException {
		if (instance == null)
			instance = new ReservationServiceImpl();
		return instance;
	}
	
	@Override
	public List<Reservation> selectReservationById(String email) {
		SqlSession session = null;
		
		try {
			session = factory.openSession();
			List<Reservation> list = dao.selectReservationById(session, email);
			session.commit();
			return list;
		}finally {
			session.close();
		}
		
	}
	
	
		
	@Override
	public List<Reservation> selectAllReservationByDate(Date date) {
		
		SqlSession session = null;
		try {
			session=factory.openSession();
			return dao.selectReservationByDate(session, new java.sql.Date(date.getYear(),date.getMonth(),date.getDate()));
		}finally {
			session.close();
		}
	}

	// 하나의 날짜를 기준으로 방들의 현황을 조회하는 것. 날짜 하루를 조회하면 그날 방의 현황을 map으로 리턴. 
	@Override
	public Map<String,Integer> selectReservationByDate(java.sql.Date date) {

		SqlSession session = null;
		try {
			session=factory.openSession();
			HashMap<String, Integer> roomMap = new HashMap<String,Integer>();
			List<Reservation> list=dao.selectReservationByDate(session, date);
			
			int r_201=0; 
			int r_202=0;
			int r_401=0;
			int r_402=0;
			int r_601=0;
			int r_602=0;
			int r_801=0;
			int r_802=0;
			
			for(Reservation r: list) {
				if(r.getRoomId() == 201){
					r_201= r_201+r.getNumberOfGuests();
				}else if(r.getRoomId() == 202) {
					r_202 = r_202+r.getNumberOfGuests();
				}else if(r.getRoomId() == 401) {
					r_401 = r_401 + r.getNumberOfGuests();
				}else if(r.getRoomId()== 402) {
					r_402 = r_402+r.getNumberOfGuests();
				}else if(r.getRoomId()== 601) {
					r_601 = r_601+r.getNumberOfGuests();
				}else if(r.getRoomId()== 602) {
					r_602 = r_602+r.getNumberOfGuests();
				}else if(r.getRoomId()== 801) {
					r_801 = r_801+r.getNumberOfGuests();
				}else if(r.getRoomId()== 802) {
					r_802 = r_802+r.getNumberOfGuests();
				}
			}
			
			roomMap.put("201", r_201);
			roomMap.put("202", r_202);
			roomMap.put("401", r_401);
			roomMap.put("402", r_402);
			roomMap.put("601", r_601);
			roomMap.put("602", r_602);
			roomMap.put("801", r_801);
			roomMap.put("802", r_802);
				
			return roomMap;

		}finally {
			session.close();
		}
	}
	
	//최종적으로 쓰는 메소드 
	// 체크인, 체크아웃 날짜를 입력하면 그 기간 내내 예약 가능한 방의 id (룸 넘버) 를 List로 리턴. 
	//selectReservationByDate 메소드는 하루기준으로 map을 리턴하는 메소드 (위에 참고) 
	// 이 메소드를, 예약하고자 하는 사람이 조회하는 기간 내내 별개의 날짜에 적용하면 
	// 각 날짜의 방 현황이 각각 map으로 리턴. 
	// 즉 날짜의 수 만큼 map 개수가 나오고, 이 map들을 list에 담은 후 list 반복문 돌리면서 각 방들이 모든 날짜에 가능한지 체크
	public List<String> emptyRoomsByDate(int guests, String checkin, String checkout) throws IOException, ParseException{
		
		RoomDao roomDao = RoomDaoImpl.getInstance();
		
		SqlSession session = null;
		ReservationService service = ReservationServiceImpl.getInstance();
		
		try {
			session=factory.openSession();

			int differ = service.dayBetween(checkin, checkout);
			Map<String,Boolean> mapOfTruth = new HashMap<String,Boolean>();
			List<Map<String,Integer>> listOfMap = new ArrayList<>();
			List<String> listOfRoomsAvail = new ArrayList<>();	
			
			SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
			Date checkin_date = format.parse(checkin);
	        Date checkout_date = format.parse(checkout);
			
	        int start_date = checkin_date.getDate();
	        for(int i = start_date ; i< start_date+ differ ; i++) {
	        	java.sql.Date newDate = new java.sql.Date(checkin_date.getYear(),checkin_date.getMonth(),i);
	        	listOfMap.add(service.selectReservationByDate(newDate));
	        }
	               
	        mapOfTruth.put("201", true);
	        mapOfTruth.put("202", true);
	        mapOfTruth.put("401", true);
	        mapOfTruth.put("402", true);
	        mapOfTruth.put("601", true);
	        mapOfTruth.put("602", true);
	        mapOfTruth.put("801", true);
	        mapOfTruth.put("802", true);
	        
	        for(Map map : listOfMap) {
	        	
	        	if((int)map.get("201") + guests > roomDao.selectMaxById(session, Integer.parseInt("201"))) {
	        		mapOfTruth.put("201", false);
	        	}if((int)map.get("202") + guests >  roomDao.selectMaxById(session, Integer.parseInt("202"))) {
	        		mapOfTruth.put("202", false);
	        	}if((int)map.get("401") + guests > roomDao.selectMaxById(session, Integer.parseInt("401"))) {
	        		mapOfTruth.put("401", false);
	        	}if((int)map.get("402") + guests > roomDao.selectMaxById(session, Integer.parseInt("402"))) {
	        		mapOfTruth.put("402", false);
	        	}if((int)map.get("601") + guests >  roomDao.selectMaxById(session, Integer.parseInt("601"))) {
	        		mapOfTruth.put("601", false);
	        	}if((int)map.get("602") + guests >  roomDao.selectMaxById(session, Integer.parseInt("602"))) {
	        		mapOfTruth.put("602", false);
	        	}if((int)map.get("801") + guests >  roomDao.selectMaxById(session, Integer.parseInt("801"))) {
	        		mapOfTruth.put("801", false);
	        	}if((int)map.get("802") + guests >  roomDao.selectMaxById(session, Integer.parseInt("802"))) {
	        		mapOfTruth.put("802", false);
	        	}
	        }
	        
	        
	        if(mapOfTruth.get("201")){
	        	listOfRoomsAvail.add("201");
	        }if(mapOfTruth.get("202")) {
	        	listOfRoomsAvail.add("202");
	        }if(mapOfTruth.get("401")) {
	        	listOfRoomsAvail.add("401");
	        }if(mapOfTruth.get("402")) {
	        	listOfRoomsAvail.add("402");
	        }if(mapOfTruth.get("601")) {
	        	listOfRoomsAvail.add("601");
	        }if(mapOfTruth.get("602")) {
	        	listOfRoomsAvail.add("602");
	        }if(mapOfTruth.get("801")) {
	        	listOfRoomsAvail.add("801");
	        }if(mapOfTruth.get("802")) {
	        	listOfRoomsAvail.add("802");
	        }
	        
	        return listOfRoomsAvail;
	        
		}finally {
			session.close();
		}
		
	}
	
	//두 날짜 사이의 날짜 수를 계산하는거. 가령 11/1~11/4 조회하면 3 나옴 
	public int dayBetween(String checkin, String checkout) throws ParseException {
		
		     // String Type을 Date Type으로 캐스팅하면서 생기는 예외로 인해 여기서 예외처리 해주지 않으면 컴파일러에서 에러가 발생해서 컴파일을 할 수 없다.
		    	SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
		        // date1, date2 두 날짜를 parse()를 통해 Date형으로 변환.
		        Date FirstDate = format.parse(checkin);
		        Date SecondDate = format.parse(checkout); 
		        
		        // Date로 변환된 두 날짜를 계산한 뒤 그 리턴값으로 long type 변수를 초기화 하고 있다.
		        // 연산결과 -950400000. long type 으로 return 된다.
		        long calDate = FirstDate.getTime() - SecondDate.getTime(); 
		        
		        // Date.getTime() 은 해당날짜를 기준으로1970년 00:00:00 부터 몇 초가 흘렀는지를 반환해준다. 
		        // 이제 24*60*60*1000(각 시간값에 따른 차이점) 을 나눠주면 일수가 나온다.
		        long calDateDays = calDate / ( 24*60*60*1000); 
		 
		        calDateDays = Math.abs(calDateDays);
		        
		        return (int)calDateDays;
		
	}
	@Override
	public void insertReservation(Reservation reservation) throws IOException {
		SqlSession session = null;

		try {
			session = factory.openSession();
			
			dao.insertReservation(session, reservation);
			session.commit();
			
		}finally {
			session.close();
		}
	
	}
	
	public static void main(String[] args) throws IOException, ParseException {
		
		ReservationService service = ReservationServiceImpl.getInstance();
		
/*		String daate = "2017-10-11";
	 	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	 	
	 	Date dddd = format.parse(daate);
	 	
		System.out.println(dddd.getDate());
		System.out.println("----------------------------------");
		java.sql.Date d = new java.sql.Date(2017-1900, 10-1, 14);
		System.out.println(d);
		
		Map map = service.selectReservationByDate(d);
		System.out.println(map);
		
		
	System.out.println("--------날짜차이---------------");	
	System.out.println(service.dayBetween("2017-08-01", "2017-08-04"));	
	System.out.println(service.dayBetween("2017-10-29", "2017-11-02"));	
	System.out.println(service.dayBetween("2017-10-29", "2017-11-12"));	*/

		//web-inf/newReservation_data.sql 의 쿼리문 실행하고 아래꺼 확인해보면 
		//401,601,801,802 나와야함 
		System.out.println(service.emptyRoomsByDate(2, "20171011", "20171013"));

	}

	@Override
	public int addReservation(int reservationId, String email, String checkIn, 
										String checkOut, int numberOfGuests,
			int roomId, String gender, int paymentStatus) throws IOException {
		SqlSession session = null;
		
		SimpleDateFormat dateForm = new SimpleDateFormat("yyyyMMdd");
		
		try {
			
			Date checkInForm = dateForm.parse(checkIn);
			Date checkOutForm = dateForm.parse(checkOut);
			session = factory.openSession();
			
		
			
			Reservation reservation = new Reservation(reservationId, email, checkInForm, checkOutForm, numberOfGuests, roomId, gender, paymentStatus);
			int result = dao.insertReservation(session, reservation);
			session.commit();
			return result;
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}  finally {
			session.close();
		}
		
		return 0;
	
	}

	@Override
	public int findReservationIdByEmail(String email) {
		SqlSession session = null;
		
		try {
			session = factory.openSession();
			int reservationId = dao.selectReservationIdByEmail(session, email);
			return reservationId;
			
		} finally {
			session.close();
		}
	}

	@Override
	public int deleteReservationByEmailDate(int reservationId, String checkIn) {
		SqlSession session = null;
		List<Object> list = new ArrayList<>();
		
		SimpleDateFormat dateForm = new SimpleDateFormat("yyyyMMdd");
		
			
			Date checkInForm;
			try {
				checkInForm = dateForm.parse(checkIn);
				list.add(reservationId);
				list.add(checkInForm);
				int deleteRow = dao.deleteReservationByEmailDate(session, list);
				
				session = factory.openSession();
				session.commit();
				return deleteRow;
				
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				session.close();
			}
			
			return 0;
		
	}

	@Override
	public int deleteReservationByNum(int reservationId) {
		SqlSession session = null;
		try {
			session = factory.openSession();
			int result = dao.deleteReservationById(session, reservationId);
			System.out.println("ServiceImpl - reservationId : " + reservationId +"/ result : " + result);
			session.commit();
			return result;
		} finally {
			session.close();
		}
	}
}


	





