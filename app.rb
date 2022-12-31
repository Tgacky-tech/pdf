require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require './models.rb'

get '/' do
  erb :index
end

get '/form' do
  erb :form
end

post '/result' do
  name = params[:name]
  
  str = params[:date]
  str1 = params[:leave]
  str2 = params[:come]
  identify = params[:identify]
  place = params[:place]
  bound = params[:bound]
  purpose = params[:purpose]
  piece = params[:piece]
  nenn = params[:nenn]
  kumi = params[:kumi]
  banngou = params[:banngou]
  age = params[:age]
  p = str.split("-")
  leave = str1.split("-")
  come = str2.split("-")
    Prawn::Document.generate("hello.pdf") do
      font("ipaexm.ttf") do
      
          text "#{p[0]}年   #{p[1]}月    #{p[2]}日　　", align: :right, size: 18
          move_down 40
          text '生徒旅客運賃割引証  交付願', align: :center, size: 20
          move_down 100
          
          date = [
              [nenn + "年", kumi + "組", banngou + "番","氏名　" + name]
              ]
          table(date,:column_widths => [60,60,60,220], :width => 400, :position => :center,:cell_style => {:borders => [:bottom],:size => 18}) do
              column(0).style :align => :right
              column(1).style :align => :right
              column(2).style :align => :right
          end
          
          move_down 30
          
          state = [
                ["学生・生徒旅客運賃割引証の交付を希望いたします。"]
              ]
          table(state,:column_widths => [400], :width => 400, :position => :center,:cell_style => {:borders => [],:size => 15}) do
            
          end
          
          box = [
            ["<font size='15'>身分証明番号</font>",{:content => "<font size='15'>#{identify}</font>", :colspan => 2},"<font size='15'>年齢</font>", "<font size='15'>#{age}才</font>"],
            ["<font size='15'>旅行先</font>", {:content => "<font size='15'>#{place}</font>", :colspan => 4}],
            ["<font size='15'>期　間</font>",{:content => "<font size='15'>#{leave[0]}年#{leave[1]}月#{leave[2]}日　～　#{come[0]}年#{come[1]}月#{come[2]}日</font>", :colspan => 4}],
            ["<font size='15'>乗車区画</font>",{:content => "<font size='15'>#{bound}</font>", :colspan => 4}],
            ["<font size='15'>目的</font>",{:content => "<font size='15'>#{purpose}</font>", :colspan => 4}],
            ["<font size='15'>希望枚数</font>","<font size='15'>#{piece}枚</font>",{:content => "<font size='15'>担任受理印　印</font>", :colspan => 3}]
            ]
          table(box,:column_widths => [100,90,70,60,80], :width => 400, :position => :center, :cell_style => {:height => 73,:inline_format => true}) do
            row(0).column(0).style:valign => :center
            row(0).column(1).style:valign => :center
            row(0).column(2).style:valign => :center
            row(0).column(3).style:valign => :center
            row(0).column(4).style:valign => :center
            row(1).column(0).style:valign => :center
            row(1).column(1).style:valign => :center
            row(1).column(2).style:valign => :center
            row(1).column(3).style:valign => :center
            row(1).column(4).style:valign => :center
            row(2).column(0).style:valign => :center
            row(2).column(1).style:valign => :center
            row(2).column(2).style:valign => :center
            row(2).column(3).style:valign => :center
            row(2).column(4).style:valign => :center
            row(3).column(0).style:valign => :center
            row(3).column(1).style:valign => :center
            row(3).column(2).style:valign => :center
            row(3).column(3).style:valign => :center
            row(3).column(4).style:valign => :center
            row(4).column(0).style:valign => :center
            row(4).column(1).style:valign => :center
            row(4).column(2).style:valign => :center
            row(4).column(3).style:valign => :center
            row(4).column(4).style:valign => :center
            row(5).column(0).style:valign => :center
            row(5).column(1).style:valign => :center
            row(5).column(2).style:valign => :center
            row(5).column(3).style:valign => :center
            row(5).column(4).style:valign => :center
            row(0).column(0).style:align => :center
            row(0).column(1).style:align => :center
            row(0).column(2).style:align => :center
            row(0).column(3).style:align => :center
            row(0).column(4).style:align => :center
            row(1).column(0).style:align => :center
            row(1).column(1).style:align => :center
            row(1).column(2).style:align => :center
            row(1).column(3).style:align => :center
            row(1).column(4).style:align => :center
            row(2).column(0).style:align => :center
            row(2).column(1).style:align => :center
            row(2).column(2).style:align => :center
            row(2).column(3).style:align => :center
            row(2).column(4).style:align => :center
            row(3).column(0).style:align => :center
            row(3).column(1).style:align => :center
            row(3).column(2).style:align => :center
            row(3).column(3).style:align => :center
            row(3).column(4).style:align => :center
            row(4).column(0).style:align => :center
            row(4).column(1).style:align => :center
            row(4).column(2).style:align => :center
            row(4).column(3).style:align => :center
            row(4).column(4).style:align => :center
            row(5).column(0).style:align => :center
            row(5).column(1).style:align => :center
            row(5).column(2).style:align => :center
            row(5).column(3).style:align => :center
            row(5).column(4).style:align => :center
          end
          move_down 5
          text "（この願いは事務室に提出すること）", align: :right, size: 15
          
      end
    end
  send_file "hello.pdf"
  erb '/'
end
