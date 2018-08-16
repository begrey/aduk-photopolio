class StuController < ApplicationController
  def new
  end
  
  def create
    @stu = Stu.new
    @stu.country = params[:country]
    @stu.title = params[:title]
    @stu.content = params[:content]
    @stu.writer = current_user.name
    @stu.save
    
    redirect_to '/stu/index'
  end

  def index
    @stus = Stu.all
  end

  def show
    @stu = Stu.find(params[:stu_id])
  end
  
  def delete
    @stu = Stu.find(params[:stu_id]).destroy
    redirect_to '/stu/index'
  end
  
  def edit
    @stu = Stu.find(params[:stu_id])
  end
  
  def update
    @stu = Stu.find(params[:stu_id])
    @stu.country = params[:country]
    @stu.title = params[:title]
    @stu.content = params[:content]
    @stu.save
    
    redirect_to '/stu/index'
  end
  
  def appnew
  end
  
  def appcreate
    @stu = Stu.find(params[:stu_id])
    @app = @stu.stuapps.create(title: params[:title], content: params[:content], stu_id: params[:stu_id], writer: current_user.name)
    @app.save
    
    @part = User.find_by(name: @stu.writer)
    @new_notification = NewNotification.create! user: @part,content: "#{current_user.name}스터디 신청글을 작성했습니다\n", link: "/stuapp/index/#{@stu.id}"
    
    redirect_to "/stu/show/#{params[:stu_id]}"
  end
  
  def appopen
    @app = Stuapp.where("stu_id = ? ",  params[:stu_id])
  end
  
  def appshow
    @stu = Stu.find(params[:stu_id])
    @app = @stu.stuapps.find_by(writer: current_user.name)
  end
  
  def appedit
    @app = Stuapp.find(params[:app_id])
  end
  
  def appupdate
    @app = Stuapp.find(params[:app_id])
    @app.title = params[:title]
    @app.content = params[:content]
    @app.save
    
    redirect_to "/stuapp/appshow/#{@app.stu_id}"
  end
  
  def appdelete
    
    @app = Stuapp.find(params[:app_id])
    @stu = Stu.find(@app.stu_id)
    @part = User.find_by(name: @stu.writer)
    @app.destroy
    @notification = NewNotification.find_by(content: "#{current_user.name}스터디 신청글을 작성했습니다\n", user: @part)
    @notification.destroy
    
    redirect_to "/stu/show/#{@app.stu_id}"
  end
  
end
