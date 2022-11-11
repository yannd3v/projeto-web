package controler;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ModelLogin;

import java.io.IOException;

import dao.DAOUsuarioRepository;

@WebServlet("/ServletUsuarioController")
public class ServletUsuarioController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    private DAOUsuarioRepository daoUsuarioRepository = new DAOUsuarioRepository();
	
	public ServletUsuarioController() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		try {
			
		 String msg = "Opera��o realizada com sucesso";
		
		 String id = request.getParameter("id");
		 String nome = request.getParameter("nome");
		 String email = request.getParameter("email");
		 String login = request.getParameter("login");
		 String senha = request.getParameter("senha");

		 ModelLogin modelLogin = new ModelLogin();
		 modelLogin.setId(id != null && !id.isEmpty() ? Long.parseLong(id) : null);
		 modelLogin.setNome(nome);
		 modelLogin.setEmail(email);
		 modelLogin.setLogin(login);
		 modelLogin.setSenha(senha);
		 
		 if(daoUsuarioRepository.validarLogin(modelLogin.getLogin()) && modelLogin.getId() == null) {
			 msg = "J� existe usu�rio com o mesmo login, informe outro login";
		 } else {
			 modelLogin = daoUsuarioRepository.gravarUsuario(modelLogin);
		 }
		 
		 request.setAttribute("msg", msg);
		 request.setAttribute("modelLogin", modelLogin);
		 request.getRequestDispatcher("principal/usuario.jsp").forward(request, response);
		 
		} catch (Exception e) {
			e.printStackTrace();
			RequestDispatcher redirecionar = request.getRequestDispatcher("erro.jsp");
			request.setAttribute("msg", e.getMessage());
			redirecionar.forward(request, response);
		}

	}

}
