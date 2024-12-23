# Функция для скрапинга текста

get_text <- function(url){
  #Sys.sleep(1) # Задержка между скрапингом страниц, (время задержки)
  read_html(url, encoding = "Windows-1251") |> 
    html_elements(".text") |> 
    html_text2() |> 
    paste(collapse=" ")
}