from django.urls import path
from . import views
urlpatterns = [

    path('', views.getRoutes),
    path("login/", views.login),
    path("signup/", views.signup),
    path("check/", views.check_authenticated),

    path('admin-details/', views.getadmindetails),
    path('user-details/', views.getuserdetails),
    path('review-details/', views.getreviewdetails),
    path('ticket-details/', views.getticketdetails),
    # path('establishmentdetails/', views.getestablishmentdetails),
    path('edit-profile/<str:pk>/', views.editProfile),
    path('delete-user/<str:pk>/', views.deleteuser),
    path('unverify-user/<str:pk>/', views.adminunverifyuser),
    path('verify-user/<str:pk>/', views.adminverifyuser),

    path('create-establishment/', views.create_establishment),
    path('view-all-establishment/', views.view_all_establishment),
    path('view-establishment/<str:pk>/', views.view_establishment),
    path('edit-establishment/<str:pk>/', views.edit_establishment), 
    path('delete-establishment/<str:pk>/', views.delete_establishment), 
    path('verify-establishment/<str:pk>/', views.verify_establishment), 
    path('archive-establishment/<str:pk>/', views.archive_establishment),
    path('unarchive-establishment/<str:pk>/', views.unarchive_establishment),
    path('report-establishment/', views.report_establishment),

    path('add-room/', views.add_room_to_establishment), 
    path('edit-room/<str:pk>/', views.edit_room), 
    path('delete-room/<str:pk>/', views.delete_room),
    
 ]