<%@page import="java.util.List"%>
<%@page import="java.awt.List"%>
<%@page import="com.smhrd.model.ProductDTO"%>
<%@page import="com.smhrd.model.ProductDAO"%>
<%@page import="com.smhrd.model.UserDTO"%>
<%@page import="com.smhrd.model.MessageDAO"%>
<%@page import="com.smhrd.model.MessageDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/styles.css">
    <style>
        .KmongDialog {
            position: fixed;
            bottom: 0;
            left: 0;
            right: 0;
            top: 0;
            width: 100%;
            height: 100%;
            text-align: center;
            z-index: 10000;
        }

        .KmongDialog--fullscreen .KmongDialog__container {
            margin: 0;
            width: 100%;
            max-width: 100%;
            height: 100%;
            max-height: 100%;
        }

        .KmongDialog__container {
            text-align: left;
            display: inline-block;
            position: relative;
            vertical-align: middle;
        }

        .KmongDialog--fullscreen.KmongDialog__content {
            border-radius: 0;
        }

        .KmongDialog__content {
            /* height: 100%; */
            position: relative;
            background-color: #ffffff;
            display: flex;
            flex-direction: column;
            /* overflow-y: auto; */
            padding: 0;
        }

        .SearchFormModal {
            flex: 1;
            display: flex;
            flex-direction: column;
        }

        .SearchFormModal__header {
            border-bottom: 1px solid #e4e5ed;
            margin-top: 8px;
            padding-bottom: 8px;
        }

        .SearchFormModal__close {
            background-color: transparent;
            border: none;
            vertical-align: middle;
            margin-top: 2px;
        }

        .SearchFormModal__close-button {
            flex-shrink: 0;
            flex-basis: 15%;
            background-color: transparent;
            border: none;
            outline: none;
            width: 46px;
            height: 46px;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 20px;
            padding: 0;
        }

        .write {
            margin-bottom: 2px;
        }

       

       .special{
    width: 60px;
    height: 30px;
    background-color: white;
}
.actions{
position: absolute;
    bottom: 105px;
    right: 5px;
    }
    .special:focus{
    background-color: rgb(82 127 239);
            color: white;
            border: 2px solid;
    }
    </style>
</head>

<body>

<%-- <%
	MessageDTO info = (MessageDTO) session.getAttribute("info");	
	MessageDAO dao = new MessageDAO();
	List<MessageDTO> myMessageList = dao.;
	%>
	<%for(int i= 0;i < product_list.size();i++){ 
                            	String file = new FileDAO().fileSelect(new FileDTO(0, "product", product_list.get(i).getP_idx()));
                				String filename = "unknown.png";
                				if (file != null) {
                					filename = file;
                				}
                            %> --%>
    <div class="KmongDialog KmongDialog--backdrop KmongDialog-s-fullscreen KmongDialog--mobile">
        <div class="KmongDialog__container">
            <div class="KmongDialog__content">
                <div class="SearchFormModal">
                    <div class="SearchFormModal__header">
							
                        <button type="button" class="SearchFormModal__close">
                            <img src="../img/small-caret-left.svg" alt="" style="width: 32px;">
                        </button>
                        <span style="font-size: 17px; font-weight: bold; position: absolute; top: 14px; left: 40px;">
                            �޽��� �ۼ�
                        </span>

                    </div>
                    <div style="border-bottom: 1px solid #e4e5ed; text-align: center;">
                        <p class="write" style="font-weight: bold;">product_list.get(i).getP_name()</p>
                        <p class="write"></p>
                    </div>
                </div>
            </div>
            


    <section id="contact">
		<div class="inner">
			<section> <!-- Q11. �޽��� ������ ���(�޽����� ��� Ȯ���ϱ� ���ؼ� DB�� ����!) -->
			<!-- �ٸ� ����� DB�� �޽��� �����غ���! -->
         <form action="MessageSendCon.do" method="post">
            <div class="field">
               <textarea name="message" id="message" rows="6" style="width:100%; position: absolute;
    bottom: 0px;" ></textarea>
            </div>
            <div class="actions" >
               <input type="submit" value="����" class="special" />
               <input type="reset" value="����"  class="special"/>
            </div>
         </form>
         </section>

        </div>
    </div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>

</html>