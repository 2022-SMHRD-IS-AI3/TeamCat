<%@page import="com.smhrd.model.FileDAO"%>
<%@page import="com.smhrd.model.FileDTO"%>
<%@page import="com.smhrd.model.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.ProductDAO"%>
<%@page import="com.smhrd.model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="../css/styles.css" rel="stylesheet" />
    <style>
        ._4a1tzy0 {
            /* margin: 0 -1rem; */
            position: relative;
        }

        ._4a1tzy1 {
            display: flex;
            flex-wrap: wrap;
        }

        .korcsc5 {
            list-style: none;
            padding: 0;
            margin: 0;
            padding-left: 25px;
            padding-right: 25px;
        }

        ._4a1tzy2 {
            width: 100%;
            box-sizing: border-box;
        }

        /* ._4a1tzy2::after{
            content: "";
            height: .0625rem;
            display: block;
            background-color: var(--seed-semantic-color-divider-2);
            margin: 0.5rem 1rem;
        } */
       
        ._1o1a6ke0 {
            transition: background-color .15s;
            width: 100%;
            background-color: var(--seed-semantic-color-paper-default);
            padding: 1rem;
            box-sizing: border-box;
            display: flex;
            align-items: flex-start;
            overflow: hidden;
            text-decoration: none;
            cursor: pointer;
            border-bottom: 1px solid #9595952e;
            padding-left: 0;
            padding-right: 0;
        }

        ._1o1a6ke2 {
            margin-right: 1rem;
        }

        ._1o1a6ke1 {
            width: 4rem;
            height: 4rem;
            border-radius: 6.25rem;
            overflow: hidden;
        }

        .qudd1g9 {
            opacity: 1;
            transition: .2s;
            position: absolute;
            left: 0;
            top: 0;
            right: 0;
            bottom: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .qudd1g0 {
            position: relative;
        }

        .qudd1g0::before {
            content: "";
            position: absolute;
            border: .0625rem solid var(--seed-scale-color-gray-alpha-50);
            border-radius: inherit;
            z-index: 1;
        }

        ._1o1a6ke3,
        ._1o1a6ke4 {
            overflow: hidden;
            display: flex;
        }

        ._1o1a6ke3 {
            flex: 1 1;
            flex-direction: column;
            align-items: flex-start;
        }

        ._1o1a6ke4 {
            align-items: center;
            white-space: nowrap;
            width: 100%;
        }

        ._1o1a6ke5 {
            font-weight: 700;
            line-height: 1.36;
            font-size: 1rem;
            color: var(--seed-scale-color-gray-900);
            overflow: hidden;
            text-overflow: ellipsis;
            color: #212124;
        }

        ._1o1a6ke6 {
            line-height: 1.5;
            font-size: .813rem;
            margin-left: 0.25rem;
            color: #868B94;
        }

        ._1o1a6ke7 {
            line-height: 1.4;
            font-size: .875rem;
            color: var(--seed-scale-color-gray-900);
            margin: .125rem 0 0;
            overflow: hidden;
            text-overflow: ellipsis;
            word-break: break-all;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            color: #212124;
        }

        ._1o1a6ke8 {
            line-height: 1.3;
            font-size: .75rem;
            margin: 0.25rem 0 0;
            color: #868B94;
        }

        .QuickMenuMobile{
        position: fixed;
        bottom: 0;
        z-index: 111;
        flex-direction: row;
        display: flex !important;
        width: 100%;
        background: white;
        box-shadow: 0 -1.5px 0 0 rgba(0, 0, 0, 0.1);
        min-height: 50px;
        padding-inline: 12px;
     }
     .QuickMenuMobile .menu-items{
        display: flex;
        align-items: center;
        flex: 1;
     }
     .QuickMenuMobile .menu{
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        padding: 8px 0;
     }
     .fl-1{
        flex: 1;
     }
    
     .QuickMenuMobile .title{
        font-size: 11px;
        margin-top: 3px;
     }
     .row > *{
        flex-shrink: 0;
        max-width: 100%;
        padding-right: calc(var(--bs-gutter-x) * 0.5);
        padding-left: calc(var(--bs-gutter-x) * 0.5);
        margin-top: var(--bs-gutter-y);
     }
    .plan_filter{
        padding: 10px 15px;
        
    }
    .plan_filter.selection{
        border: 0;
        width: auto;
    }
    .selection{
        position: relative;
        display: inline-block;
        background-color: #fff;
        padding-left: 205px;
    
    }
    
    .selection select{
        position: relative;
        border: 0;
        width: 85px;
        z-index: 1;
        background: transparent;
        vertical-align: baseline;
        font-size: 14px;
    }
    #sort{
        width: 68px;
    }
    </style>
</head>
<body>
	<%
	ProductDAO dao = new ProductDAO();
	List<ProductDTO> product_list = dao.ProductAll();
	%>
	
	<div>
		<a href="./Write/">게시물 등록</a>
	</div>
	<div id="Product">
		<table id="list" border=1>
			<%
			for (int i = 0; i < product_list.size(); i++) {

				String file = new FileDAO().fileSelect(new FileDTO(0, "product", product_list.get(i).getP_idx()));
				String filename = "";
				if (file != null) {
					filename = file;
				}
				
				System.out.println(filename);

				String contact_addr = product_list.get(i).getContact_addr();
				if (contact_addr == null) {
					contact_addr = "";
				}
			%>

			<tr>
				<td><img alt="" src="/Kkeonaeng/file/<%=filename%>"
					style="width: 80px; height: 80px; object-fit: cover;"></td>
				<td><a
					href="./Detail/?p_idx=<%=product_list.get(i).getP_idx()%>"><%=product_list.get(i).getP_name()%></a></td>
				<td><%=contact_addr%></td>
				<td><%=product_list.get(i).getPrice()%></td>


			</tr>

			<%
			}
			%>

		</table>
	</div>

</body>
</html>