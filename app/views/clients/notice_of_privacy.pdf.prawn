require "prawn/measurement_extensions"

months = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"]

pdf = Prawn::Document.new
pdf.text "<b><u>AVISO DE PRIVACIDAD</u></b>", align: :center, inline_format: true
pdf.move_down 1.mm
pdf.font_size 9.2
pdf.text "<b>GRUPO VESTA, S.A. DE C.V.</b>, con domicilio en la calle de Calle las Trojes No. 104-B, Fracc. Las Haciendas en lomas 4ta sección, C.P. 78216, en la ciudad de San Luis Potosí, S.L.P., México (en adelante <b>“GRUPO VESTA”</b>”),reconoce la importancia que tiene el tratamiento legítimo, controlado e informado de sus datos personales y pone a sus disposición el presente Aviso de Privacidad, a fin de que conozca sus prácticas al obtener, usar, almacenar y, en general, tratar sus datos personales, de conformidad con la <b>Ley Federal de Protección de Datos Personales en Posesión de los Particulares</b> (en adelante la “LEY”).", align: :justify, inline_format: true
pdf.move_down 1.mm
pdf.text "<u><b>Datos Personales que pudieran ser tratados</b></u>", inline_format: true
pdf.move_down 1.mm
pdf.text "Algunos de los datos personales que nos proporcione voluntariamente, ya sea con motivo de sus antecedentes curriculares y académicos, cartas, correos electrónicos, así como aquellos que nos proporcione con miras al establecimiento de una relación jurídica, o para contratar nuestros servicios, o adquirir inmuebles de nuestra propiedad, pueden ser: <b>Datos de identificación</b>, tales como: nombre, domicilio particular, fecha de nacimiento, CURP, número de teléfono, fijo o móvil, fax, correo electrónico. <b>Datos académicos</b>, tales como: trayectoria educativa, título, número de cédula profesional, especialidad, certificados. <b>Datos laborales</b>, tales como: puesto, domicilio, correo electrónico, número de teléfono, fijo o móvil y fax. <b>Datos de facturación</b>, tales como: entidad a la que se hará el cargo, domicilio fiscal, RFC. Datos financieros, tales como: información de cuentas bancarias, forma de pago. <b>Datos de voz e imagen</b>, con motivo de seguridad del establecimiento comercial o de los desarrollos inmobiliarios.", align: :justify, inline_format: true
pdf.move_down 1.mm
pdf.text "<u><b>Finalidades de uso de los datos personales</b></u>", inline_format: true
pdf.move_down 1.mm
pdf.text "Los datos personales que nos proporcione, serán utilizados para contactarlo en caso de que su perfil resulte de interés para la firma, y aquellos que se obtengan por motivo de una relación jurídica, cuyo tratamiento sea necesario para cumplir con obligaciones derivadas de dicha relación, serán utilizados para celebrar contratos de promesa y transmisión de dominio, corroborar su antecedentes y referencias personales para el otorgamiento de crédito y contratación laboral, fines publicitarios. Sus datos personales podrían utilizarse para finalidades distintas a las antes mencionadas o las incluidas en los Avisos de Privacidad, que se pongan a su disposición, siempre y cuando dichas finalidades sean compatibles con las descritas y puedan considerarse análogas.", align: :justify, inline_format: true
pdf.move_down 1.mm
pdf.text "<u><b>Transferencias de datos personales</b></u>", inline_format: true
pdf.move_down 1.mm
pdf.text "<b>GRUPO VESTA</b> no venderá, cederá o transferirá sus datos personales a terceros sin su consentimiento previo.  Sin embargo, <b>GRUPO VESTA</b> podrá  transferir sus datos personales cuando dicha transferencia esté prevista en la Ley, incluyendo la necesidad de realizar argumentos en demandas y demás instancias judiciales que se intenten en su nombre. El Cliente es conforme en que en caso de que <b>GRUPO VESTA</b> participe en cualquier operación que sea susceptible de aviso a la Secretaria de Hacienda y Crédito Público, en términos de los dispuesto por la Ley Federal para la Prevención e Identificación de Operaciones con Recursos de Procedencia Ilícita, o bien en caso de ser requerida por parte de la Autoridad para proporcionar información en relación con las operaciones de actividades vulnerables procederá en consecuencia, sin que ello implique responsabilidad alguna de <b>GRUPO VESTA</b> al amparo de la relación contractual, laboral y de servicios sostenida, así como en relación con la protección de datos personales al amparo de lo dispuesto por la Ley Federal de Protección de Datos Personales en Posesión de los Particulares.", align: :justify, inline_format: true
pdf.move_down 1.mm
pdf.text "<u><b>Medidas de Seguridad</b></u>", inline_format: true
pdf.move_down 1.mm
pdf.text "<b>GRUPO VESTA</b> ha adoptado y mantiene las medidas de seguridad, administrativas, técnicas y físicas, necesarias para proteger sus datos personales contra daño, pérdida, alteración, destrucción o el uso, acceso o tratamiento no autorizado. Sin embargo, es claro que ninguna comunicación de datos por Internet es totalmente segura, por lo que GRUPO VESTA no puede garantizar que sus datos personales estarán libres de todo daño, pérdida, alteración, destrucción o el uso, acceso o tratamiento no autorizado.", align: :justify, inline_format: true
pdf.move_down 1.mm
pdf.text "<u><b>Derechos que le corresponden al titular de datos personales</b></u>", inline_format: true
pdf.move_down 1.mm
pdf.text "Como titular de datos personales, usted puede ejercitar ante <b>GRUPO VESTA</b> los derechos de acceso, rectificación, cancelación y oposición (derechos “ARCO”). Asimismo, puede revocar, en todo momento, el consentimiento que haya otorgado y que fuere necesario para el tratamiento de sus datos personales, así como limitar el uso o divulgación de los mismos.  Lo anterior, a través del envío de su solicitud en los términos establecidos por la Ley al correo electrónico: omarflores@burdeosresidencial.com o en la Calle las Trojes No. 104-B, Fracc. Las Haciendas en lomas 4ta sección, C.P. 78216, en la ciudad de San Luis Potosí, S.L.P., México.", align: :justify, inline_format: true
pdf.move_down 1.mm
pdf.text "<u><b>Cambios al aviso de privacidad</b></u>", inline_format: true
pdf.move_down 1.mm
pdf.text "En caso de existir cambios sustanciales o totales en el presente Aviso de Privacidad o en el que en su momento se le proporcione, se pondrá a su disposición la versión actualizada del mismo en nuestro sitio web <b>www. burdeosresidencial.com</b>", align: :justify, inline_format: true
pdf.move_down 1.mm
pdf.text "<u><b>Contacto</b></u>", inline_format: true
pdf.move_down 1.mm
pdf.text "En caso de tener dudas o comentarios respecto del Aviso de Privacidad, le pedimos contacte al encargado de protección de datos personales, a través de la siguiente dirección de correo electrónico omarflores@burdeosresidencial.com, o en la Calle las Trojes No. 104-B, Fracc. Las Haciendas en lomas 4ta sección, C.P. 78216, en la ciudad de San Luis Potosí, S.L.P., de la Ciudad de San Luis Potosí, S.L.P., México.", align: :justify, inline_format: true
pdf.text "En términos de la Ley y su Reglamento, le informamos que, ante la negativa de respuesta a la solicitudes de derechos ARCO o inconformidad con la misma, usted puede presentar ante el Instituto Federal de Acceso a la Información y Protección de Datos, la correspondiente Solicitud de Protección de Derechos en los plazos y términos fijados por la Ley y su Reglamento.", align: :justify, inline_format: true
pdf.move_down 2.mm
pdf.text "<b>Recibe de conformidad el presente aviso:</b>", inline_format: true
pdf.text "<b>Aguascalientes, Ags. a #{Date.today.day} de #{months[Date.today.month - 1]} de #{Date.today.year}.</b>", inline_format: true
pdf.move_down 10.mm
pdf.text "____________________________________", align: :center, inline_format: true
pdf.text "<b>#{@client.fullname}</b>", align: :center, inline_format: true
pdf.render