---
title: API Oriented Development
author: Mitch
tags: rails, ruby
---

## or: How I Learned to Stop Worrying and Love the HTTP

I recently worked on a large Rails project that needed to be client agnostic. The plan was to release the product on Android, iOS, and as a standard web app. We decided it best to build an api, and have our various clients consume that api -- [we ate our own dogfood](http://en.wikipedia.org/wiki/Eating_your_own_dog_food). I've been writing Rails apps since there was a Rails, and typically, I just use the standard out of the box MVC setup. However, because we aimed to get this app on multiple clients, the V in [MVC](http://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93controller) would be at best redundant, and at worst useless.

##How to Use Rails with AOD 
Of course you don't have to use Rails or any fullstack framework for this. You might be thinking, hmm, how about a micro framework? How about Sinatra? Well, I love [Sinatra](http://www.sinatrarb.com/) to death, but after using it for a few years, I'm of the mindset that it's not appropriate for large projects. After my Sinatra applications grow to a certain size, I just find myself recreating Rails all over. In basic web frameworks, I'd rather ignore what I don't need, than build what is missing.

###It's an API! JSON is your friend.
Plug those HTML holes. Your controllers should not render any HTML. You're clients will only consume JSON, so there is no reason for the controller to return any HTML. Since it's uneccesary and thus, could be overlooked, leaving the format.html calls in there could be a security risk. Rails and ActiveModel make it pretty easy for to work with JSON by supplying some convenience methods we can use.

~~~~{.ruby}
  ###users_controller.rb
  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.json { render json: @user }
    end
  end


  ###user.rb
  has_many :books
  def as_json(options={})
    super(:only => [:id, :username],
          :methods => [:some_instance_method, :another_instance_method],
          :include => {
            :books => {
              :only => [:id, :title, :author_id]
             }	      
          }
          )
  end
~~~~

Be careful with include in the as_json method, as silly association calls can hit the db pretty hard. It's possible to get pretty deep with nested includes, but that should be code smell. Sometimes, it's better to just do a separate api call than have a waterfall of include hashes.

###Security cannot be a secondary thought
When you use Rails to generate a scaffold you are presented with the following in the create and update actions:

~~~~{.ruby}
def create				
  @user = User.new(params[:user])
  #...
end

def update 
  #...
  if @user.update_attributes(params[:user])
  #...
end 
~~~~

Just looking at it now gets my Spidey sense a' tingling. Using params[:some_model] to build or update an object is putting a lot of trust in the users of your application. We simply can't have that in production code. Rails 3 has helped us a bit by having [attr_accessible](http://api.rubyonrails.org/classes/ActiveModel/MassAssignmentSecurity/ClassMethods.html#method-i-attr_accessible) set upon model generation (mitigating mass assignment exploits). However, as I've told people during training, we don't write code for ourselves, we write code for the developer who's gonna [inherit](http://c2.com/cgi/wiki?CodeForTheMaintainer) it. Aside from the exploit concerns of the above, anyone reading this code (without consulting the UML or checking schema.rb) has no idea what fields this model is being sent (or should be sent) to build a viable record. If anything is capable of altering your db, then the code enabling this had best be explicit, for reasons of security and sanity.

~~~~{.ruby}
def create
  #some initial param checks
  @user = User.new(:username => params[:username], :email => params[:email],...)
  #...
end
~~~~

This coupled with proper model validations should take care of any mass assignment hacks. So, how does this relate to AOD? Well, since we're eating our own dog food, we're also making clients that have to communicate with the application. In doing so, you become quite aware as to what params you are sending around. In my case, since we weren't tied to using Rails' forms, we simplified our param naming scheme (not really a fan Rails' default param hashes, as I find them unwieldly to write by hand). The point is, the params are in your face, and can't be ignored, as is possible with a rails g scaffold.

NOTE: In such an architecture, we can't rely on browser sessions to identify users. Proper identification of requests is a bit more complex in this setup. One solution is to pass a unique identifier with each request from a client. I'll save the nitty gritty for a later blog entry.

###So uh, what about those clients?
For any client you are planning to work with, it would be a good idea to create a wrapper for your api calls. You can easily roll your own using the stanadrd HTTP library for whatever language your client is using. Or, you can use an external libraries -- a quick google search lead me to these: [Android -- Restlet](http://wiki.restlet.org/docs_2.1/2-restlet.html) and [iOS -- RestKit](http://restkit.org/). I haven't personally used either, but they seem pretty respected on the interwebs.


###Service Oriented Architecture by default
To consuming clients, your application becomes a black box, that just spits out JSON according to HTTP verbs. You'll notice, when following this design style, your application is much more loosely coupled than a standard MVC architecture. Because the app is client agnostic, we don't really care who is communicating with the application, so the app can't have any features tied to any one consumer (iOS, Android, command line, etc.). With this in mind, it's a simple step to create more applications in a similar manner, and have them communicate given some pre-defined channels. In fact, I'd say AOD is a pre-requsite for a massive SOA set up. Of course, depending on your needs, you may have to communicate over some other protocol besides HTTP, but the core concepts don't really change. A very important aspect of SOA is determining the best mode of communication between your internal services. In the future, I plan to delve deeper into [Erlang/OTP](http://www.erlang.org/), as I understand distrubuted system design is a core tenet in its philosophy. 

###Conclusion
When starting development for any idea or application, you have to consider scope and distrubution options. AOD/SOA may be overkill for your project, or it may be the perfect fit. For me, after pumping out CRUD after CRUD of MVC products, going the AOD route was a breath of fresh air. And, the dog food wasn't so bad.