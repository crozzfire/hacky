var _t = this;
Meteor.startup(function () {
  Router.map(function() {
    this.route('about', {
      path: '/about',
      template: getTemplate('about'),
      onBeforeAction: function(){
      	_t.isStaticPage = true;      	
      },
      onStop: function(){
      	_t.isStaticPage = false;
      }
    });
  });
});