package com.beleningalina.health_safe_paciente

import android.app.Activity
import android.content.Intent
import com.mercadopago.android.px.core.MercadoPagoCheckout
import com.mercadopago.android.px.model.Payment
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel
import kotlin.collections.HashMap

class MainActivity: FlutterActivity() {
    private lateinit var flutterView: BinaryMessenger

    private companion object {
        private const val REQUEST_CODE: Int = 1
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        flutterView = flutterEngine.dartExecutor.binaryMessenger

        val channelMercadoPago = MethodChannel(flutterView, "health_safe/mercado_pago")
        channelMercadoPago.setMethodCallHandler { methodCall, result ->
            val args: HashMap<String, String> = methodCall.arguments as HashMap<String, String>
            val publicKey = args["publicKey"] as String
            val preferenceId = args["preferenceId"] as String

            when (methodCall.method) {
                "mercadoPago" -> {
                    print("mercadoPago")
                    mercadoPago(publicKey, preferenceId, result)
                }
                else -> {
                    println("else")
                    return@setMethodCallHandler
                }
            }
        }
    }

    private fun mercadoPago(publicKey: String, preferenceId: String, channelResult: MethodChannel.Result) {
        println(channelResult)
        MercadoPagoCheckout.Builder(publicKey, preferenceId)
            .build()
            .startPayment(this@MainActivity, REQUEST_CODE)
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)

        val channelMercadoPagoResp = MethodChannel(flutterView, "health_safe/mercado_pago_response")


        when(resultCode) {
            MercadoPagoCheckout.PAYMENT_RESULT_CODE -> {
                println("PAYMENT_RESULT_CODE -> Result code: $resultCode")
                val payment = data?.getSerializableExtra(MercadoPagoCheckout.EXTRA_PAYMENT_RESULT) as Payment
                println("Payment: $payment")
                val paymentStatus = payment.paymentStatus
                val paymentStatusDetail = payment.paymentStatusDetail
                val paymentId = payment.id

                val arrayList = arrayListOf<String>(
                    paymentId.toString(),
                    paymentStatus,
                    paymentStatusDetail
                )
                channelMercadoPagoResp.invokeMethod("mercadoPagoOK", arrayList)
            }

            Activity.RESULT_CANCELED -> {
                println("RESULT_CANCELED -> Result code: $resultCode = 0")

                val arrayList = arrayListOf<String>(
                    "Error"
                )
                channelMercadoPagoResp.invokeMethod("mercadoPagoFailed", arrayList)
            }

            else -> {
                println("RESULT_CANCELED -> Result code: $resultCode")

                val arrayList = arrayListOf<String>(
                    "Cancelado"
                )
                channelMercadoPagoResp.invokeMethod("mercadoPagoCanceled", arrayList)
            }
        }
    }
}