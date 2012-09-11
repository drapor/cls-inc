' Remarque : pour obtenir des instructions sur l'activation du mode classique IIS6 ou IIS7, 
' visitez http://go.microsoft.com/?LinkId=9394802

Public Class MvcApplication
    Inherits System.Web.HttpApplication

    Shared Sub RegisterRoutes(ByVal routes As RouteCollection)
        routes.IgnoreRoute("{resource}.axd/{*pathInfo}")

        ' MapRoute prend les paramètres suivants, dans l'ordre :
        ' (1) Nom d'itinéraire
        ' (2) URL avec paramètres
        ' (3) Paramètres par défaut
        routes.MapRoute( _
            "Default", _
            "{controller}/{action}/{id}", _
            New With {.controller = "Home", .action = "Index", .id = UrlParameter.Optional} _
        )

    End Sub

    Sub Application_Start()
        AreaRegistration.RegisterAllAreas()

        RegisterRoutes(RouteTable.Routes)
    End Sub
End Class
