package com.example.cinema.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.cinema.dao.AdminDAO;
import com.example.cinema.dao.CboardDAO;
import com.example.cinema.dao.EventDAO;
import com.example.cinema.dao.MemberDAO;
import com.example.cinema.dao.ProductDAO;
import com.example.cinema.dao.ShowDAO;
import com.example.cinema.dto.AdminDTO;
import com.example.cinema.dto.EventDTO;
import com.example.cinema.dto.MemberDTO;
import com.example.cinema.dto.ProductDTO;

import jakarta.servlet.ServletContext;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@MultipartConfig(maxFileSize = 1024 * 1024 * 10)
@Controller
public class AdminCotroller {

	@Autowired
	AdminDAO adminDao;
	@Autowired
	ProductDAO productDao;
	@Autowired
	ShowDAO showDao;
	@Autowired
	MemberDAO memberDao;
	@Autowired
	EventDAO eventDao;
	@Autowired
	CboardDAO cboardDao;

	@PostMapping("/admin/login.do")
	public ModelAndView login(AdminDTO dto, HttpSession session) {
		AdminDTO dto1 = adminDao.login(dto);
		if (dto1 != null) {
			String name = dto1.getName();
			session.setAttribute("userid", dto1.getUserid());
			session.setAttribute("name", dto1.getName());
			session.setAttribute("pwd1", dto1.getPwd1());
			session.setAttribute("result", name + "님 환영합니다");
		}
		ModelAndView mav = new ModelAndView();
		if (dto1 != null) {
			mav.setViewName("admin/admin_result");
		} else {
			mav.setViewName("member/login");
			mav.addObject("message", "error");
		}
		return mav;

	}

	@GetMapping("/admin/list.do")
	public String list(Model model) {
		List<ProductDTO> items = productDao.list();
		model.addAttribute("list", items);
		return "admin/product_list";
	}

	@GetMapping("/admin/write.do")
	public String write() {
		return "admin/product_write";
	}

	@GetMapping("/admin/event_list.do")
	public String event_list(Model model) {
		List<EventDTO> items = showDao.list_Event();
		model.addAttribute("list", items);
		return "admin/event_list";
	}

	@GetMapping("/admin/member_list.do")
	public String member_list(Model model) {
		List<MemberDTO> items = memberDao.listMember();
		model.addAttribute("list", items);
		return "admin/member_list";
	}

	@PostMapping("/admin/insert_product.do")
	public String insert_product(HttpServletRequest request) {
		ServletContext application = request.getSession().getServletContext();
		String img_path = application.getRealPath("/resources/images/");
		String filename = "";
		try {

			for (Part part : request.getParts()) {
				filename = part.getSubmittedFileName();
				if (filename != null && !filename.trim().equals("")) {
					part.write(img_path + filename);
					break;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		String product_name = request.getParameter("product_name");
		int product_type = Integer.parseInt(request.getParameter("product_type"));
		int price = Integer.parseInt(request.getParameter("price"));
		String description = request.getParameter("description");
		ProductDTO dto = new ProductDTO();
		dto.setProduct_name(product_name);
		dto.setProduct_type(product_type);
		dto.setPrice(price);
		dto.setDescription(description);
		if (filename == null || filename.trim().equals("")) {
			filename = "-";
		}
		dto.setFilename(filename);
		productDao.insert(dto);
		return "redirect:/admin/list.do";
	}

	@GetMapping("/admin/edit.do")
	public String edit(@RequestParam(name = "product_code") int product_code, Model model) {
		ProductDTO dto = productDao.detail(product_code);
		model.addAttribute("dto", dto);
		return "admin/edit";
	}

	@PostMapping("/admin/update.do")
	public String update(HttpServletRequest request) {
		ServletContext application = request.getSession().getServletContext();
		String img_path = application.getRealPath("/resources/images/");
		String filename = "";
		try {
			for (Part part : request.getParts()) {
				filename = part.getSubmittedFileName();
				if (filename != null && !filename.trim().equals("")) {
					part.write(img_path + filename);
					break;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		String product_name = request.getParameter("product_name");
		int product_type = Integer.parseInt(request.getParameter("product_type"));
		int price = Integer.parseInt(request.getParameter("price"));
		String description = request.getParameter("description");
		int product_code = Integer.parseInt(request.getParameter("product_code"));
		ProductDTO dto = new ProductDTO();
		dto.setProduct_name(product_name);
		dto.setProduct_type(product_type);
		dto.setPrice(price);
		dto.setDescription(description);
		dto.setProduct_code(product_code);
		if (filename == null || filename.trim().equals("")) {
			ProductDTO dto2 = productDao.detail(product_code);
			filename = dto2.getFilename();
			dto.setFilename(filename);
		} else {
			dto.setFilename(filename);
		}
		productDao.update(dto);
		return "redirect:/admin/list.do";
	}

	@GetMapping("/admin/delete.do")
	public String delete(@RequestParam(name = "product_code") int product_code) {
		productDao.delete(product_code);
		return "redirect:/admin/list.do";
	}

	@GetMapping("/admin/memberdetail.do")
	public String memberdetail(@RequestParam(name = "userid") String userid, Model model) {
		MemberDTO dto = memberDao.detailMember(userid);
		model.addAttribute("dto", dto);
		return "admin/member_detail";
	}

	@GetMapping("/admin/view.do")
	public String view(@RequestParam(name = "num") int num, Model model) {
		System.out.println("num" + num);
		EventDTO dto = eventDao.view(num);
		model.addAttribute("dto", dto);
		return "admin/view";
	}

	@GetMapping("/admin/eventdelete.do")
	public String evnetdelete(@RequestParam(name = "num") int num) {
		eventDao.delete(num);
		return "redirect:/admin/event_list.do";
	}

	@GetMapping("/admin/eventwrite.do")
	public String eventwrite() {
		return "admin/write";
	}
	@PostMapping("/admin/eventinsert.do")
	public String eventinsert(HttpServletRequest request) {
		EventDTO dto = new EventDTO();
		ServletContext application = request.getSession().getServletContext();
		String img_path = application.getRealPath("/resources/images/");
		String filename1 = "";
		String filename2 = ""; // 두 번째 파일 이름을 저장할 변수 추가
		try {
			int fileCount = 0; // 업로드된 파일 수를 추적하기 위한 변수 추가
			for (Part part : request.getParts()) {
				String filename = part.getSubmittedFileName();

				if (filename != null && !filename.trim().equals("")) {
					// 두 개의 파일이 모두 업로드되었는지 확인
					if (fileCount == 0) {
						filename1 = filename;

					} else if (fileCount == 1) {
						filename2 = filename;

					}
					part.write(img_path + filename);
					fileCount++;
					// 두 개의 파일이 모두 업로드되면 루프 종료
					if (fileCount == 2) {
						break;
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		String subject = request.getParameter("subject");
		String contents = request.getParameter("contents");
		String type = request.getParameter("type");

		dto.setSubject(subject);
		dto.setContents(contents);
		dto.setType(type);
		dto.setFilename1(filename1);
		dto.setFilename2(filename2); // 두 번째 파일 이름도 DTO에 설정
		eventDao.insert(dto);
		return "redirect:/admin/event_list.do";
	}
	@GetMapping("/admin/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "home";
	}
}
