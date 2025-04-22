import com.android.build.gradle.AppExtension

val android = project.extensions.getByType(AppExtension::class.java)

android.apply {
    flavorDimensions("flavor-type")

    productFlavors {
        create("openhouse") {
            dimension = "flavor-type"
            applicationId = "com.findorlookup.openhouse"
            resValue(type = "string", name = "app_name", value = "Open House")
        }
        create("streetfood") {
            dimension = "flavor-type"
            applicationId = "com.findorlookup.streetfood"
            resValue(type = "string", name = "app_name", value = "Street Food")
        }
    }
}