import '../models/disease_model.dart';

class LocalDiseaseDB {
  static final List<DiseaseModel> diseases = [
    // ==================== BANANA ====================
    DiseaseModel(
      id: "banana_yellow_sigatoka",
      name: "Banana Yellow Sigatoka",
      severity: "MATAAS NA PELIGRO",
      description:
      "Ang Yellow Sigatoka ay isang fungal disease na mabilis kumalat sa ma-humid na kondisyon. Nagdudulot ito ng yellow streaks na nagiging brown spots sa dahon ng saging, na nagre-reduce ng photosynthesis at bumababa ang ani. Ang sakit na ito ay sanhi ng fungus na Pseudocercospora musae.",
      treatments: TreatmentPlan(
        immediateAction:
        "Alisin agad at dispose nang maayos (sunugin o ibaon) ang infected na dahon para mapigilan ang pagkalat ng sakit.",
        organic:
        "Gumamit ng neem oil o compost tea sprays para ma-suppress ang fungal growth at palakasin ang resistensya ng halaman.",
        chemical:
        "Mag-apply ng recommended fungicides tulad ng mancozeb o chlorothalonil every 7–14 days, lalo na tuwing tag-ulan. Sundin ang tamang dosage at safety guidelines.",
        biological:
        "Mag-introduce ng beneficial microorganisms tulad ng Trichoderma species na natural na lumalaban sa fungus.",
      ),
      prevention:
      "Magtanim ng resistant varieties, siguraduhin ang proper spacing para sa magandang air circulation, at regular na i-monitor ang dahon para sa early signs ng infection. I-practice ang pruning, weed control, at iwasan ang overhead irrigation para mabawasan ang moisture sa dahon. Mapabuti rin ang drainage at siguraduhin ang balanced fertilization (lalo na potassium).",
    ),

    DiseaseModel(
      id: "banana_cordana",
      name: "Banana Cordana Leaf Spot",
      severity: "KATAMTAMANG PELIGRO",
      description:
      "Ang Cordana leaf spot ay dulot ng fungus na Cordana musae. Lumalabas ito bilang oval o elongated brown lesions na may yellow border sa dahon ng saging. Hindi tulad ng Sigatoka, kadalasang naapektuhan nito ang stressed na halaman, lalo na ang may poor nutrition, sobrang moisture, o mababa ang liwanag. Bagama't bihirang magdulot ng malaking pagkawala ng ani, puwede nitong pahinain ang halaman at bawasan ang leaf efficiency.",
      treatments: TreatmentPlan(
        immediateAction:
        "Alisin ang infected na dahon na may oval brown spots na may yellow halos at dispose nang maayos para maiwasan ang pagkalat.",
        organic:
        "Gumamit ng neem oil spray o baking soda solution (mild antifungal) para pabagalin ang pagkalat sa early stages.",
        chemical:
        "Mag-apply ng fungicides tulad ng mancozeb o copper-based sprays kung ang infection ay malala na, lalo na sa wet na kondisyon.",
        biological:
        "Mag-apply ng beneficial fungi tulad ng Trichoderma para mapabuti ang plant resistance at ma-suppress ang harmful pathogens sa lupa.",
      ),
      prevention:
      "Iwasan ang leaf wetness sa pamamagitan ng pagpapabuti ng drainage at spacing; huwag mag-overcrowd ng halaman at alisin ang sobrang shade. Bawasan ang overhead watering, siguraduhin ang sapat na sunlight exposure, at panatilihin ang balanced fertilization (lalo na potassium).",
    ),

    DiseaseModel(
      id: "banana_healthy",
      name: "Malusog na Saging",
      severity: "MALUSOG",
      description:
      "Ang malusog na halaman ng saging ay may malapad at matingkad na berdeng dahon na walang spots, streaks, o discoloration. Ipinapakita nito ang malakas na upright growth, makapal na pseudostem, at consistent na leaf production. Ang tamang nutrisyon, water management, at sikat ng araw ang mga susi sa pagpapanatili ng kalusugan ng halaman.",
      treatments: TreatmentPlan(
        immediateAction:
        "Walang treatment na kailangan; ipagpatuloy ang regular na monitoring at tamang care practices.",
        organic:
        "Gumamit ng compost, vermicast, o organic mulch para pataasin ang soil nutrients at mapabuti ang moisture retention.",
        chemical:
        "Mag-apply ng balanced fertilizers (hal. NPK 14-14-14 o 17-17-17) kung kinakailangan para suportahan ang growth at maiwasan ang nutrient deficiencies.",
        biological:
        "Itaguyod ang beneficial microorganisms sa lupa (hal. Trichoderma at mycorrhizae) para mapabuti ang nutrient absorption at plant resistance.",
      ),
      prevention:
      "Panatilihin ang proper spacing, siguraduhin ang good drainage, at regular na inspeksyunin ang halaman para sa early signs ng pests o diseases. Magbigay ng sapat na sunlight, consistent na watering (hindi sobra), at alisin ang tuyo o lumang dahon para mapanatili ang plant vigor.",
    ),

    DiseaseModel(
      id: "banana_insect_pest",
      name: "Banana Insect Pest",
      severity: "KATAMTAMANG PELIGRO",
      description:
      "Ang mga pesteng insekto sa saging ay kinabibilangan ng aphids, weevils, thrips, at caterpillars na sumisira sa dahon, tangkay, at ugat, na nagre-reduce ng plant growth at yield. Ang ilang peste, tulad ng aphids, ay puwede ring mag-transmit ng viral diseases. Ang infestation ay madalas mangyari sa mga hindi maayos na pinamamahalaang farm na may high humidity at sobrang nutrients.",
      treatments: TreatmentPlan(
        immediateAction:
        "Inspeksyunin ang halaman at manually alisin ang visible pests (tulad ng caterpillars o beetles) at wasakin ang heavily infested na mga bahagi.",
        organic:
        "Gumamit ng neem oil spray o soap solution para kontrolin ang soft-bodied insects tulad ng aphids at mites.",
        chemical:
        "Mag-apply ng appropriate insecticides tulad ng imidacloprid o chlorpyrifos (gamitin lamang kung severe ang infestation at sundin ang safety guidelines).",
        biological:
        "Mag-introduce ng natural enemies tulad ng lady beetles, lacewings, o parasitic wasps para bawasan ang pest populations.",
      ),
      prevention:
      "Panatilihing malinis ang lugar, alisin ang plant debris, gumamit ng pest-resistant varieties, at regular na mag-monitor para sa early signs ng infestation. Iwasan ang over-fertilization (lalo na nitrogen), panatilihin ang proper spacing, at mapabuti ang airflow para mabawasan ang pest buildup.",
    ),

    DiseaseModel(
      id: "banana_dry_leaf",
      name: "Banana Dry Leaf Disease",
      severity: "KATAMTAMANG PELIGRO",
      description:
      "Ang dry leaf disease sa saging ay hindi laging isang single disease kundi isang condition kung saan ang mga dahon ay nagiging brown, tuyo, at namamatay nang maaga dahil sa mga salik tulad ng fungal infections, drought stress, nutrient deficiency, o poor farm management. Kadalasang nagsisimula ito sa edges ng dahon at kumakalat papunta sa loob, na nagre-reduce ng kakayahang mag-photosynthesize ng halaman.",
      treatments: TreatmentPlan(
        immediateAction:
        "Gupitin at alisin ang tuyo o severely affected na dahon at dispose nang maayos para maiwasan ang pagkalat at hayaan ang bagong healthy growth.",
        organic:
        "Gumamit ng compost tea o neem extract para palakasin ang plant resistance at mabawasan ang mild infections.",
        chemical:
        "Mag-apply ng fungicides tulad ng mancozeb o copper-based sprays kung ang symptoms ay kumakalat at pinaniniwalaang fungal ang sanhi.",
        biological:
        "Mag-apply ng beneficial microorganisms tulad ng Trichoderma para protektahan ang halaman mula sa fungal pathogens at mapabuti ang soil health.",
      ),
      prevention:
      "Siguraduhin ang proper irrigation (iwasan ang drought at waterlogging), panatilihin ang good spacing, at regular na i-monitor ang kondisyon ng halaman. Mapabuti ang soil fertility gamit ang balanced nutrients (lalo na potassium), bawasan ang plant stress, at siguraduhin ang sapat na sunlight at airflow.",
    ),

    DiseaseModel(
      id: "banana_mosaic",
      name: "Banana Mosaic Disease",
      severity: "MATAAS NA PELIGRO",
      description:
      "Ang Banana mosaic disease ay isang viral infection na nagdudulot ng light at dark green mosaic patterns, streaking, o mottling sa mga dahon. Ang infected na halaman ay nagpapakita ng stunted growth at reduced yield. Ang virus ay kumakalat pangunahin sa pamamagitan ng insect vectors tulad ng aphids at sa pamamagitan ng infected planting materials. Dahil walang lunas kapag nahawa na ang halaman, ang management ay nakatuon sa early detection, pag-alis ng infected plants, at mahigpit na control ng vectors.",
      treatments: TreatmentPlan(
        immediateAction:
        "Alisin agad at wasakin ang infected na halaman para maiwasan na kumalat ang virus sa malulusog na halaman.",
        organic:
        "Gumamit ng neem oil spray para itaboy ang aphids at mabawasan ang virus transmission.",
        chemical:
        "Walang direktang chemical cure para sa viral diseases; sa halip, mag-apply ng insecticides (hal. imidacloprid) para kontrolin ang aphids na nagta-transmit ng virus.",
        biological:
        "Hikayatin ang natural predators tulad ng lady beetles at lacewings para kontrolin ang aphid populations.",
      ),
      prevention:
      "Gumamit ng virus-free planting materials, kontrolin ang insect vectors, at regular na inspeksyunin ang halaman para sa early mosaic symptoms. Iwasan ang pagtatanim ng infected suckers, panatilihin ang field sanitation, at i-isolate ang bagong halaman bago ipakilala sa farm.",
    ),

    DiseaseModel(
      id: "banana_panama",
      name: "Banana Panama Disease",
      severity: "MATAAS NA PELIGRO",
      description:
      "Ang Banana Panama disease, na kilala rin bilang Fusarium wilt, ay isang seryosong soil-borne fungal disease na dulot ng Fusarium oxysporum f. sp. cubense. Ini-infect nito ang halaman sa pamamagitan ng ugat at humaharang sa movement ng tubig, na nagdudulot ng pagkuyellow ng dahon, wilting, at eventual na pagkamatay ng halaman. Ang fungus ay puwedeng mabuhay sa lupa nang maraming taon, kaya napakahirap itong kontrolin kapag naitatag na.",
      treatments: TreatmentPlan(
        immediateAction:
        "Bunutin at wasakin ang infected na halaman nang lubusan (kasama ang roots at corms) at iwasan ang paglipat ng contaminated soil sa ibang lugar.",
        organic:
        "Mapabuti ang soil health gamit ang compost, organic matter, at biofertilizers para tulungan ma-suppress ang pathogen activity sa lupa.",
        chemical:
        "Walang effective chemical cure para sa Panama disease kapag nahawa na ang halaman. Hindi reliable ang fungicides para sa control.",
        biological:
        "Mag-apply ng beneficial microbes tulad ng Trichoderma species para tulungan mabawasan ang pagkalat ng fungus sa soil environment.",
      ),
      prevention:
      "Gumamit ng disease-free planting materials, practice crop rotation, at iwasan ang pagtatanim ng saging sa heavily infected na lupa. Pumili ng resistant varieties kung available. Mapabuti ang drainage, i-disinfect ang tools pagkatapos gamitin, at iwasan ang paggamit ng contaminated soil o suckers mula sa infected na halaman.",
    ),

    // ==================== COCONUT ====================
    DiseaseModel(
      id: "coconut_bud_root_dropping",
      name: "Coconut Bud Root Dropping",
      severity: "MATAAS NA PELIGRO",
      description:
      "Ang Coconut bud rot (madalas na tinatawag na bud dropping kapag severe) ay isang sakit na karaniwang dulot ng Phytophthora palmivora, isang fungus na mahilig sa tubig. Inaatake nito ang growing point (bud) ng coconut palm, na nagdudulot ng pagkabulok ng spear leaves, pagiging brown, at eventual na pagbagsak. Kapag hindi agad naagapan, ang buong puno ay puwedeng mamatay. Ang sakit ay karaniwan tuwing tag-ulan at ma-humid na kondisyon at mabilis kumalat sa pamamagitan ng water splash at poor sanitation.",
      treatments: TreatmentPlan(
        immediateAction:
        "Alisin at wasakin ang infected na coconut palms o severely affected na buds para maiwasan ang pagkalat ng sakit sa mga kalapit na puno.",
        organic:
        "Mag-apply ng neem-based extracts o botanical fungicide sprays para tulungan ma-suppress ang fungal growth sa early infection stages.",
        chemical:
        "Mag-apply ng fungicides na naglalaman ng copper oxychloride o metalaxyl-mancozeb sa mga kalapit na malulusog na palms bilang protective spray (early stage lamang).",
        biological:
        "Gumamit ng beneficial microbes tulad ng Trichoderma species sa paligid ng root zone para mabawasan ang soil-borne fungal pathogens.",
      ),
      prevention:
      "Mapabuti ang drainage, iwasan ang water accumulation sa paligid ng base, at siguraduhin ang proper spacing sa pagitan ng coconut trees. Regular na linisin ang crown area, alisin ang decaying plant material, at iwasan ang injury sa growing bud (spear leaf).",
    ),

    DiseaseModel(
      id: "coconut_bud_rot",
      name: "Coconut Bud Rot",
      severity: "MATAAS NA PELIGRO",
      description:
      "Ang Coconut bud rot ay isang seryosong sakit na pangunahing dulot ng fungus na Phytophthora palmivora. Inaatake nito ang growing bud (spear leaf) ng coconut palm, na nagdudulot ng pagkabulok, pagiging brown, at pagbagsak nito. Sa severe na kaso, ang buong palm ay namamatay. Ang sakit ay mabilis kumalat tuwing tag-ulan at ma-humid na conditions sa pamamagitan ng water splash at contaminated plant material. Dahil walang lunas kapag fully infected na ang bud, ang real-world management ay nakatuon sa early detection, preventive fungicide application, sanitation, at pagpapabuti ng drainage.",
      treatments: TreatmentPlan(
        immediateAction:
        "Alisin at wasakin ang severely infected na coconut palms para mapigilan ang pagkalat ng sakit sa mga kalapit na puno.",
        organic:
        "Gumamit ng neem-based extracts o botanical antifungal solutions para tulungan ma-suppress ang early fungal activity at suportahan ang plant defense.",
        chemical:
        "Mag-apply ng copper-based fungicides (hal. copper oxychloride) o metalaxyl + mancozeb bilang preventive sprays sa mga kalapit na malulusog na palms, lalo na sa early infection o tag-ulan.",
        biological:
        "Mag-apply ng Trichoderma species sa paligid ng root zone para mabawasan ang soil-borne fungal pathogens at mapabuti ang plant resistance.",
      ),
      prevention:
      "Panatilihin ang proper field drainage, iwasan ang water accumulation malapit sa base, at siguraduhin ang good spacing sa pagitan ng palms para mabawasan ang humidity buildup. Regular na linisin ang crown area, alisin ang decaying organic matter, at iwasan ang mechanical injury sa bud (growing point).",
    ),

    DiseaseModel(
      id: "coconut_caterpillar_spot",
      name: "Coconut Caterpillar Spot",
      severity: "KATAMTAMANG PELIGRO",
      description:
      "Ang Coconut caterpillar spot ay hindi isang single disease kundi isang uri ng leaf damage na dulot ng caterpillar larvae na kumakain sa dahon ng niyog. Nagreresulta ito sa maliliit na butas o shot-like spots na puwedeng lumaki at maging mas malalaking damaged areas, na nagre-reduce ng kakayahang mag-photosynthesize ng halaman. Ang severe na infestation ay puwedeng pahinain ang palm at bawasan ang nut production.",
      treatments: TreatmentPlan(
        immediateAction:
        "Manually alisin ang visible na caterpillars at i-prune ang heavily damaged na leaflets. Sunugin o dispose nang maayos ang infested na plant parts.",
        organic:
        "Gumamit ng neem oil spray o mild soap solution para kontrolin ang young caterpillars at bawasan ang feeding damage.",
        chemical:
        "Mag-apply ng insecticides tulad ng lambda-cyhalothrin o chlorpyrifos tuwing severe infestation, sundin ang proper dosage at safety precautions.",
        biological:
        "Hikayatin ang natural predators tulad ng ibon, parasitic wasps, at beneficial insects na natural na nagko-control ng caterpillar populations.",
      ),
      prevention:
      "Regular na inspeksyunin ang dahon ng niyog, panatilihin ang field cleanliness, at iwasan ang sobrang nitrogen fertilizer na umaakit ng pests. Mapabuti ang tree health sa pamamagitan ng proper fertilization at irrigation para mas matolerate ng palms ang minor pest damage.",
    ),

    DiseaseModel(
      id: "coconut_fruit_healthy",
      name: "Malusog na Bunga ng Niyog",
      severity: "MALUSOG",
      description:
      "Ang malusog na bunga ng niyog ay firm, well-formed, at walang cracks, discoloration, o pest damage. Ang husk ay intact, at ang tubig sa loob ng mga young coconuts ay malinaw at sariwa. Ang malusog na coconut production ay depende sa tamang nutrisyon, lalo na ang potassium, magandang soil drainage, at regular na farm maintenance.",
      treatments: TreatmentPlan(
        immediateAction:
        "Walang treatment na kailangan. Ipagpatuloy ang regular na monitoring ng coconut palms at fruits.",
        organic:
        "Gumamit ng compost, decomposed coconut husk, at organic manure para mapabuti ang soil fertility at moisture retention.",
        chemical:
        "Mag-apply ng balanced fertilizers (lalo na potassium-rich fertilizers tulad ng KCl) para suportahan ang strong nut development at mapabuti ang fruit quality.",
        biological:
        "Hikayatin ang beneficial soil microorganisms para mapabuti ang nutrient uptake at overall tree health.",
      ),
      prevention:
      "Panatilihin ang proper spacing sa pagitan ng coconut trees, alisin ang weeds, at regular na inspeksyunin para sa early pest o disease signs. Siguraduhin ang consistent na watering tuwing dry periods, iwasan ang nutrient imbalance, at protektahan ang fruits mula sa mechanical damage (falling debris o pests).",
    ),

    DiseaseModel(
      id: "coconut_fruit_infected",
      name: "Infected na Bunga ng Niyog",
      severity: "KATAMTAMANG PELIGRO",
      description:
      "Ang infected na bunga ng niyog ay maaaring magpakita ng mga sintomas tulad ng discoloration, soft o rotting areas, cracks, premature dropping, o insect holes. Ang mga karaniwang sanhi ay kinabibilangan ng fungal infections, insect pests (tulad ng coconut beetles o caterpillars), at poor environmental conditions tulad ng sobrang moisture o nutrient imbalance. Sa severe na kaso, ang infection ay puwedeng makaapekto sa fruit quality at bawasan ang yield.",
      treatments: TreatmentPlan(
        immediateAction:
        "Alisin at wasakin ang infected o fallen fruits para maiwasan na kumalat ang pests at pathogens sa malulusog na nuts.",
        organic:
        "Gumamit ng neem oil spray o botanical extracts para mabawasan ang pest activity at pabagalin ang early fungal development.",
        chemical:
        "Mag-apply ng appropriate fungicides (hal. copper-based sprays) para sa fungal infections at insecticides lamang kung confirmed at severe ang pest infestation.",
        biological:
        "Hikayatin ang beneficial organisms at gumamit ng Trichoderma sa lupa para tulungan ma-suppress ang fungal pathogens sa paligid ng root zone.",
      ),
      prevention:
      "Panatilihin ang orchard cleanliness, alisin ang decaying plant material, at regular na inspeksyunin ang fruits para sa early signs ng damage. Mapabuti ang tree nutrition (lalo na potassium at calcium), siguraduhin ang proper drainage, at iwasan ang overcrowding ng coconut palms.",
    ),

    DiseaseModel(
      id: "coconut_gray_leaf_spot",
      name: "Coconut Gray Leaf Spot",
      severity: "KATAMTAMANG PELIGRO",
      description:
      "Ang Coconut grey leaf spot ay isang fungal disease na nagdudulot ng maliliit na grey to brown lesions sa dahon ng niyog, na maaaring lumaki at mag-merge, na nagdudulot ng pagkatuyo ng dahon at reduced photosynthesis. Ito ay thrive sa warm, humid, at rainy conditions. Kapag hindi na-manage, puwede nitong pahinain ang palm at bawasan ang nut production.",
      treatments: TreatmentPlan(
        immediateAction:
        "Alisin at sunugin ang severely infected na dahon para mabawasan ang fungal spore spread sa mga kalapit na palms.",
        organic:
        "Gumamit ng neem oil o iba pang plant-based antifungal sprays para tulungan pabagalin ang early spread ng sakit.",
        chemical:
        "Mag-apply ng copper-based fungicides (tulad ng copper oxychloride) o mancozeb sa early infection, lalo na sa wet seasons.",
        biological:
        "Mag-apply ng Trichoderma spp. sa lupa o bilang foliar support para tulungan ma-suppress ang fungal pathogens nang natural.",
      ),
      prevention:
      "Siguraduhin ang proper spacing sa pagitan ng coconut trees, mapabuti ang airflow, at iwasan ang prolonged leaf wetness sa pamamagitan ng pagpapanatili ng good drainage. Palakasin ang plant nutrition, lalo na potassium, at regular na i-prune ang lumang o heavily shaded fronds para mabawasan ang humidity.",
    ),

    DiseaseModel(
      id: "coconut_leaf_rot",
      name: "Coconut Leaf Rot",
      severity: "KATAMTAMANG PELIGRO",
      description:
      "Ang Coconut leaf rot ay isang fungal condition na nagdudulot ng pagka-soft, pagkabulok, at pagiging brown o black ng leaf tissues, na kadalasang nagsisimula sa spots na kumakalat sa buong leaf surface. Ito ay karaniwang nabubuo sa warm, wet, at poorly ventilated na environment. Kapag hindi na-manage nang maaga, bumababa ang kakayahang mag-photosynthesize ng halaman, na pahinain ang palm at bawasan ang nut production.",
      treatments: TreatmentPlan(
        immediateAction:
        "Alisin at wasakin ang infected na dahon na nagpapakita ng soft rot, dark patches, o decaying tissue para maiwasan ang fungal spread.",
        organic:
        "Gumamit ng neem extract o iba pang natural antifungal sprays para tulungan pabagalin ang infection sa early stages.",
        chemical:
        "Mag-apply ng copper-based fungicides (hal. copper oxychloride) o mancozeb sa early infection, lalo na sa wet at humid na kondisyon.",
        biological:
        "Mag-apply ng beneficial fungi tulad ng Trichoderma sa lupa at sa paligid ng root zone para ma-suppress ang fungal pathogens.",
      ),
      prevention:
      "Mapabuti ang drainage, iwasan ang waterlogging, at siguraduhin ang proper spacing para sa better airflow at reduced humidity sa paligid ng dahon. I-prune ang overcrowded fronds, panatilihin ang balanced fertilization (lalo na potassium), at iwasan ang overhead irrigation na nagpapa-stay ng tubig sa dahon nang matagal.",
    ),

    DiseaseModel(
      id: "coconut_stem_bleeding",
      name: "Coconut Stem Bleeding",
      severity: "MATAAS NA PELIGRO",
      description:
      "Ang Coconut stem bleeding ay isang fungal disease na karaniwang dulot ng Thielaviopsis paradoxa. Ito ay characterized ng dark reddish-brown to black liquid na tumutulo mula sa cracks o wounds sa trunk. Habang tumatagal ang sakit, ang stem tissue ay nabubulok internally, na pahinain ang palm at puwedeng magdulot ng pagkamatay kapag hindi ginamot. Ito ay madalas na nabubuo dahil sa stress conditions tulad ng poor nutrition, physical injury, o sobrang moisture.",
      treatments: TreatmentPlan(
        immediateAction:
        "Kaskasihin ang affected bark area hanggang ma-expose ang healthy tissue, pagkatapos ay mag-apply ng protective fungicidal paste sa sugat.",
        organic:
        "Gumamit ng neem oil o herbal antifungal pastes (halo sa clay o lime) para tulungan protektahan ang exposed tissue.",
        chemical:
        "Mag-apply ng copper-based fungicides o Bordeaux paste directly sa infected stem area para ma-suppress ang fungal activity.",
        biological:
        "Mag-apply ng Trichoderma spp. sa paligid ng root zone para tulungan mabawasan ang soil-borne fungal pathogens na nagko-contribute sa infection.",
      ),
      prevention:
      "Iwasan ang mechanical injury sa trunk, mapabuti ang drainage, at panatilihin ang proper nutrition para palakasin ang resistance ng palm. Alisin ang severely affected trees kung advanced na ang infection, at regular na i-monitor ang mga kalapit na palms para sa early symptoms.",
    ),

    // ==================== CORN ====================
    DiseaseModel(
      id: "corn_cercospora_leaf_spot",
      name: "Corn Cercospora Leaf Spot",
      severity: "KATAMTAMANG PELIGRO",
      description:
      "Ang Cercospora leaf spot sa mais ay isang fungal disease na dulot ng Cercospora zeae-maydis. Lumalabas ito bilang maliliit na gray to tan lesions sa dahon na lumalaki at maaaring mag-merge, na nagre-reduce ng kakayahang mag-photosynthesize ng halaman. Ang severe na infection ay puwedeng magdulot ng premature leaf death at yield loss. Ang sakit ay mabilis kumalat sa warm, humid na kondisyon, lalo na sa dense planting.",
      treatments: TreatmentPlan(
        immediateAction:
        "Alisin at wasakin ang heavily infected na dahon para mabawasan ang fungal spore spread sa field.",
        organic:
        "Gumamit ng neem-based sprays o compost tea para tulungan ma-suppress ang early fungal growth at mapabuti ang plant resistance.",
        chemical:
        "Mag-apply ng fungicides tulad ng mancozeb, azoxystrobin, o propiconazole sa early signs ng infection, sundin ang proper dosage at spray intervals.",
        biological:
        "Mag-apply ng beneficial microbes tulad ng Trichoderma species para mabawasan ang fungal pathogens sa soil at crop residue.",
      ),
      prevention:
      "Practice crop rotation, iwasan ang paulit-ulit na pagtatanim ng mais sa parehong field, at gumamit ng resistant corn varieties kung available. Mapabuti ang air circulation sa pamamagitan ng proper spacing, bawasan ang sobrang nitrogen fertilization, at i-manage ang crop residues pagkatapos ng harvest.",
    ),

    DiseaseModel(
      id: "corn_common_rust",
      name: "Corn Common Rust",
      severity: "KATAMTAMANG PELIGRO",
      description:
      "Ang Corn common rust ay isang fungal disease na dulot ng Puccinia sorghi. Lumalabas ito bilang maliliit na reddish-brown to orange pustules sa parehong sides ng corn leaves. Ang mga pustules na ito ay nagre-release ng spores na madaling kumalat sa pamamagitan ng hangin, lalo na sa cool to moderate temperatures na may high humidity. Ang severe na infections ay puwedeng mag-reduce ng photosynthesis, pahinain ang halaman, at bawasan ang yield.",
      treatments: TreatmentPlan(
        immediateAction:
        "Alisin ang heavily infected na dahon kung posible at iwasan ang pagkalat ng spores sa pamamagitan ng handling o movement sa field.",
        organic:
        "Gumamit ng neem-based sprays o compost extracts para tulungan pabagalin ang early fungal development at suportahan ang plant health.",
        chemical:
        "Mag-apply ng fungicides tulad ng mancozeb, azoxystrobin, o propiconazole sa early infection stages, lalo na kapag ang rust pustules ay nagsisimula nang lumabas.",
        biological:
        "Mag-apply ng beneficial microbes tulad ng Trichoderma spp. sa lupa para mapabuti ang overall plant resistance sa fungal diseases.",
      ),
      prevention:
      "Magtanim ng resistant corn varieties, iwasan ang overcrowding, at practice crop rotation para masira ang disease cycle. Siguraduhin ang proper fertilization (iwasan ang excess nitrogen), mapabuti ang air circulation sa tamang spacing, at regular na i-monitor ang crops tuwing humid na kondisyon.",
    ),

    DiseaseModel(
      id: "corn_healthy",
      name: "Malusog na Mais",
      severity: "MALUSOG",
      description:
      "Ang malusog na halaman ng mais ay may malalakas na berdeng dahon, upright growth, at uniform development na walang visible spots, rust, o lesions. Ipinapakita nito ang magandang root establishment at balanced nutrient uptake, na nagreresulta sa optimal photosynthesis at high yield potential. Sa real farming practice, ang pagpapanatili ng malusog na mais ay depende sa proper soil management, balanced fertilization, pest prevention, at good water control.",
      treatments: TreatmentPlan(
        immediateAction:
        "Walang treatment na kailangan. Ipagpatuloy ang regular na monitoring para sa pests, diseases, at nutrient status.",
        organic:
        "Gumamit ng compost, farm manure, o organic fertilizers para mapabuti ang soil fertility at mapanatili ang long-term soil health.",
        chemical:
        "Mag-apply ng balanced fertilizers (lalo na NPK) batay sa crop stage para suportahan ang strong growth at high yield.",
        biological:
        "Hikayatin ang beneficial soil microorganisms para mapabuti ang nutrient uptake at plant resistance sa pests at diseases.",
      ),
      prevention:
      "Practice crop rotation, proper spacing, at regular field inspection para maiwasan ang pest at disease outbreaks. Panatilihin ang proper irrigation (iwasan ang drought stress o waterlogging), kontrolin ang weeds, at siguraduhin ang sapat na sunlight exposure.",
    ),

    DiseaseModel(
      id: "corn_northern_leaf_blight",
      name: "Corn Northern Leaf Blight",
      severity: "MATAAS NA PELIGRO",
      description:
      "Ang Corn Northern Leaf Blight ay isang fungal disease na dulot ng Exserohilum turcicum. Lumalabas ito bilang mahahabang, cigar-shaped gray to tan lesions sa dahon ng mais. Ang mga lesions na ito ay lumalaki sa favorable na conditions, na nagdudulot ng pagkatuyo ng dahon at reduced photosynthesis. Ang severe na infections ay puwedeng magdulot ng significant yield loss, lalo na sa warm, humid na environment.",
      treatments: TreatmentPlan(
        immediateAction:
        "Alisin at wasakin ang severely infected na dahon para mabawasan ang fungal spores sa field at pabagalin ang pagkalat ng sakit.",
        organic:
        "Gumamit ng neem-based sprays o compost extracts para tulungan ma-suppress ang early fungal growth at suportahan ang plant defense.",
        chemical:
        "Mag-apply ng fungicides tulad ng mancozeb, chlorothalonil, azoxystrobin, o propiconazole sa early infection stages, lalo na sa humid na kondisyon.",
        biological:
        "Mag-apply ng beneficial fungi tulad ng Trichoderma spp. para mapabuti ang soil health at mabawasan ang fungal pathogen activity.",
      ),
      prevention:
      "Magtanim ng resistant corn varieties, i-rotate ang crops (iwasan ang continuous corn planting), at i-manage ang crop residues nang maayos pagkatapos ng harvest. Siguraduhin ang proper spacing para sa airflow, iwasan ang sobrang nitrogen fertilization, at regular na i-monitor ang crops tuwing wet at humid na panahon.",
    ),

    // ==================== PINEAPPLE ====================
    DiseaseModel(
      id: "pineapple_crown_rot",
      name: "Pineapple Crown Rot Disease",
      severity: "MATAAS NA PELIGRO",
      description:
      "Ang Pineapple crown rot disease ay pangunahing dulot ng mga fungi tulad ng Phytophthora at Fusarium species. Inaatake nito ang crown at base ng halaman, na nagdudulot ng soft, brown, at decaying tissue. Ang infected na halaman ay maaaring malanta, mabulok, at eventually mamatay, lalo na sa wet at poorly drained na conditions. Ang sakit ay kumakalat sa pamamagitan ng contaminated soil, water splash, at infected planting materials.",
      treatments: TreatmentPlan(
        immediateAction:
        "Alisin at wasakin ang infected na halaman, lalo na ang may crown softening o rotting, para maiwasan ang pagkalat sa mga kalapit na halaman.",
        organic:
        "Gumamit ng neem extract o iba pang plant-based antifungal solutions para pabagalin ang early fungal development at protektahan ang malulusog na halaman.",
        chemical:
        "Mag-apply ng fungicides tulad ng metalaxyl + mancozeb o copper-based fungicides bilang drench o spray sa early infection stages.",
        biological:
        "Mag-apply ng beneficial microbes tulad ng Trichoderma spp. sa lupa para ma-suppress ang fungal pathogens na nagdudulot ng crown rot.",
      ),
      prevention:
      "Siguraduhin ang well-drained soil, iwasan ang waterlogging, at gumamit ng disease-free planting materials (malulusog na suckers o crowns). Iwasan ang overhead irrigation na nagpapa-stay ng crown na basa, mapabuti ang field sanitation, at space plants nang maayos para sa better airflow.",
    ),

    DiseaseModel(
      id: "pineapple_fruit_fasciation",
      name: "Pineapple Fruit Fasciation Disorder",
      severity: "MABABANG PELIGRO",
      description:
      "Ang Pineapple fruit fasciation disorder ay isang physiological condition kung saan ang bunga ay abnormal na nagde-develop ng flattened, fused, o irregular shapes. Hindi ito dulot ng bacteria, fungi, o viruses kundi kadalasang linked sa hormonal imbalance, genetic factors, environmental stress, o early damage sa growing point ng halaman. Bagama't edible pa rin ang bunga, nababawasan ang market value nito dahil sa itsura.",
      treatments: TreatmentPlan(
        immediateAction:
        "Alisin at itapon ang deformed na fruits para maiwasan ang pag-aaksaya ng plant energy at mapanatili ang plantation hygiene.",
        organic:
        "Mag-apply ng compost o well-decomposed organic fertilizer para mabawasan ang plant stress at suportahan ang normal na fruit development.",
        chemical:
        "Walang specific chemical treatment na available dahil ang fasciation ay hindi dulot ng pathogen. Gayunpaman, maaaring gumamit ng insecticides lamang kung may insect damage (hal. mites o sucking pests) na pinaghihinalaan sa early fruit development.",
        biological:
        "Panatilihin ang malusog na lupa gamit ang beneficial microorganisms (tulad ng compost-based microbes) para mapabuti ang plant growth balance.",
      ),
      prevention:
      "Gumamit ng healthy planting materials, kontrolin ang insect pests nang maaga, at panatilihin ang stable growing conditions para maiwasan ang stress habang nabubuo ang bunga. Iwasan ang sobrang nitrogen fertilization, iwasan ang physical injury sa halaman, at siguraduhin ang proper irrigation at drainage para mabawasan ang environmental stress.",
    ),

    DiseaseModel(
      id: "pineapple_fruit_rot",
      name: "Pineapple Fruit Rot Disease",
      severity: "MATAAS NA PELIGRO",
      description:
      "Ang Pineapple fruit rot disease ay pangunahing dulot ng fungal pathogens tulad ng Phytophthora at Fusarium. Nagdudulot ito ng softening, discoloration, at decay ng bunga, na kadalasang nagsisimula sa base o crown at mabilis kumalat sa ilalim ng warm, humid, at wet conditions. Ang sakit ay puwedeng magdulot ng significant yield loss kapag hindi na-manage nang maaga.",
      treatments: TreatmentPlan(
        immediateAction:
        "Alisin at wasakin agad ang infected na fruits para maiwasan ang pagkalat ng rot sa mga kalapit na fruits at halaman.",
        organic:
        "Gumamit ng neem extract o iba pang natural antifungal solutions para pabagalin ang early fungal growth at protektahan ang malulusog na fruits.",
        chemical:
        "Mag-apply ng fungicides tulad ng metalaxyl + mancozeb o copper-based fungicides bilang preventive spray sa early infection o high-risk rainy periods.",
        biological:
        "Mag-apply ng beneficial microbes tulad ng Trichoderma spp. sa lupa para ma-suppress ang fungal pathogens na responsable sa fruit rot.",
      ),
      prevention:
      "Siguraduhin ang proper drainage, iwasan ang waterlogging, at pigilan ang direct contact ng fruits sa basang lupa. Gumamit ng disease-free planting materials. Mapabuti ang field sanitation, bawasan ang excess moisture sa paligid ng halaman, at iwasan ang overhead irrigation na nagpapa-stay ng fruits na basa nang matagal.",
    ),

    DiseaseModel(
      id: "pineapple_healthy",
      name: "Malusog na Pinya",
      severity: "MALUSOG",
      description:
      "Ang malusog na halaman ng pinya ay may firm, green leaves na walang spots, rot, o discoloration. Ang bunga ay well-shaped, evenly developed, at walang deformities o decay. Ang malusog na paglaki ay depende sa tamang soil nutrition, lalo na ang potassium, magandang drainage, at epektibong pest management. Ang malulusog na halaman ng pinya ay mas resistant sa diseases tulad ng fruit rot at crown rot, na nagreresulta sa better harvest quality.",
      treatments: TreatmentPlan(
        immediateAction:
        "Walang treatment na kailangan. Ipagpatuloy ang regular na monitoring para sa pests, diseases, at fruit development.",
        organic:
        "Gumamit ng compost, animal manure, o organic mulch para mapabuti ang soil fertility at mapanatili ang moisture balance.",
        chemical:
        "Mag-apply ng balanced fertilizers (NPK na may mas mataas na potassium sa fruiting stage) para suportahan ang strong fruit formation at sweetness.",
        biological:
        "Itaguyod ang beneficial soil microorganisms para mapabuti ang nutrient uptake at palakasin ang plant resistance sa stress.",
      ),
      prevention:
      "Gumamit ng disease-free planting materials, siguraduhin ang proper spacing, at regular na inspeksyunin ang halaman para sa early pest o disease signs. Panatilihin ang good drainage, iwasan ang waterlogging, at magbigay ng consistent pero hindi sobrang irrigation para sa optimal growth.",
    ),

    DiseaseModel(
      id: "pineapple_wilt",
      name: "Pineapple Wilt Disease",
      severity: "MATAAS NA PELIGRO",
      description:
      "Ang Pineapple wilt disease ay karaniwang associated sa Mealybug Wilt of Pineapple, na dulot ng viruses na transmitted ng mealybugs. Ang mga infected na halaman ay nagpapakita ng sintomas tulad ng leaf yellowing, curling, stunted growth, at wilting, na eventually ay nagdudulot ng paghina at pagkamatay ng halaman. Ang sakit ay kumakalat pangunahin sa pamamagitan ng insect vectors at infected planting materials.",
      treatments: TreatmentPlan(
        immediateAction:
        "Alisin at wasakin ang severely infected na halaman na nagpapakita ng wilting at yellowing para maiwasan ang pagkalat sa malulusog na halaman.",
        organic:
        "Gumamit ng neem oil spray para tulungan mabawasan ang mealybug populations at pabagalin ang disease transmission.",
        chemical:
        "Mag-apply ng insecticides tulad ng imidacloprid para kontrolin ang mealybugs, na ang common vectors ng sakit, lalo na sa early infestation stages.",
        biological:
        "Mag-introduce ng natural enemies ng mealybugs tulad ng lady beetles at parasitic wasps para natural na bawasan ang vector populations.",
      ),
      prevention:
      "Gumamit ng disease-free planting materials, kontrolin ang mealybugs nang maaga, at iwasan ang pagtatanim sa dating infested na fields. Mapabuti ang soil drainage, panatilihin ang proper plant spacing, at regular na i-monitor ang halaman para sa early signs ng stress o pest infestation.",
    ),

    DiseaseModel(
      id: "pineapple_multiple_crown",
      name: "Pineapple Multiple Crown Disorder",
      severity: "MABABANG PELIGRO",
      description:
      "Ang Pineapple multiple crown disorder ay isang physiological condition kung saan ang bunga ay nagde-develop ng more than one crown sa halip na isang normal na crown. Hindi ito dulot ng fungi, bacteria, o viruses kundi linked sa genetic variation, hormonal imbalance, environmental stress, o damage during early fruit formation. Bagama't edible pa rin ang bunga, itinuturing itong abnormal at may mas mababang market value.",
      treatments: TreatmentPlan(
        immediateAction:
        "Alisin at itapon ang fruits na may severe crown abnormalities kung hindi ito marketable, para i-focus ang plant energy sa healthy development.",
        organic:
        "Mag-apply ng well-decomposed compost o organic fertilizers para mabawasan ang plant stress at suportahan ang balanced growth.",
        chemical:
        "Walang direct chemical treatment na available dahil ito ay physiological disorder, hindi dulot ng pathogens.",
        biological:
        "Panatilihin ang healthy soil microbiota gamit ang compost-based inputs para mapabuti ang overall plant stability at nutrient uptake.",
      ),
      prevention:
      "Gumamit ng healthy planting materials, kontrolin ang insect pests nang maaga, at iwasan ang environmental stress sa early fruit development. Iwasan ang sobrang nitrogen fertilization, siguraduhin ang proper irrigation, at panatilihin ang stable growing conditions para mabawasan ang hormonal imbalance sa halaman.",
    ),

    DiseaseModel(
      id: "pineapple_root_rot",
      name: "Pineapple Root Rot Disease",
      severity: "MATAAS NA PELIGRO",
      description:
      "Ang Pineapple root rot disease ay karaniwang dulot ng soil-borne fungi tulad ng Phytophthora at Fusarium. Inaatake nito ang mga ugat, na nagdudulot ng pagkabulok, pagiging brown o black, at pagkawala ng function. Bilang resulta, ang halaman ay nagpapakita ng stunted growth, wilting, yellowing leaves, at eventual na pagkamatay kapag hindi na-control. Ang sakit ay mas severe sa poorly drained at overly wet na soils.",
      treatments: TreatmentPlan(
        immediateAction:
        "Bunutin at wasakin ang severely infected na halaman para maiwasan ang pagkalat ng sakit sa pamamagitan ng lupa at tubig.",
        organic:
        "Gumamit ng well-decomposed compost at neem-based soil treatments para tulungan ma-suppress ang fungal growth at mapabuti ang soil health.",
        chemical:
        "Mag-apply ng fungicides tulad ng metalaxyl + mancozeb o copper-based products bilang soil drench sa early infection stages.",
        biological:
        "Mag-apply ng beneficial fungi tulad ng Trichoderma spp. sa lupa para natural na makipag-compete at mabawasan ang root rot pathogens.",
      ),
      prevention:
      "Siguraduhin ang proper drainage, iwasan ang waterlogged soil, at gumamit ng disease-free planting materials. Iwasan ang overwatering, mapabuti ang soil aeration, at panatilihin ang balanced fertilization para palakasin ang root development.",
    ),

    // ==================== SUGARCANE ====================
    DiseaseModel(
      id: "sugarcane_healthy",
      name: "Malusog na Tubo",
      severity: "MALUSOG",
      description:
      "Ang malusog na halaman ng tubo ay may matangkad at matatag na stalks na may berdeng dahon, strong tillering, at uniform growth. Walang signs ng pests, leaf spots, o stem damage. Ang malusog na sugarcane development ay depende sa tamang nutrient balance (lalo na nitrogen, phosphorus, at potassium), sapat na water supply, at magandang soil conditions.",
      treatments: TreatmentPlan(
        immediateAction:
        "Walang treatment na kailangan. Ipagpatuloy ang regular na field monitoring para sa pests, diseases, at growth performance.",
        organic:
        "Gumamit ng compost, green manure, o farmyard manure para mapabuti ang soil fertility at mapanatili ang long-term productivity.",
        chemical:
        "Mag-apply ng balanced fertilizers (lalo na nitrogen para sa growth at potassium para sa sugar content) batay sa crop stage at soil test results.",
        biological:
        "Hikayatin ang beneficial soil microorganisms para mapabuti ang nutrient absorption at plant resistance sa pests at diseases.",
      ),
      prevention:
      "Practice crop rotation, panatilihin ang proper spacing, at regular na alisin ang weeds para mabawasan ang competition at pest buildup. Siguraduhin ang proper irrigation (iwasan ang water stress o flooding), panatilihin ang good drainage, at i-manage ang ratoon crops nang maayos para sa uniform growth.",
    ),

    DiseaseModel(
      id: "sugarcane_mosaic",
      name: "Sugarcane Mosaic Disease",
      severity: "MATAAS NA PELIGRO",
      description:
      "Ang Sugarcane mosaic disease ay isang viral infection na nagdudulot ng light at dark green streaks o mosaic patterns sa dahon. Ang mga infected na halaman ay madalas magpakita ng stunted growth, reduced vigor, at lower sugar yield. Ang virus ay pangunahing kumakalat sa pamamagitan ng infected planting materials at sap-feeding insects tulad ng aphids.",
      treatments: TreatmentPlan(
        immediateAction:
        "Bunutin at wasakin ang infected na halaman para maiwasan ang further spread, dahil viral ang sakit at hindi ito puwedeng gamutin.",
        organic:
        "Gumamit ng neem oil spray para mabawasan ang aphid populations at limitahan ang virus transmission.",
        chemical:
        "Walang direct chemical cure. Maaaring gumamit ng insecticides (hal. imidacloprid) para kontrolin ang aphids, na ang vectors ng virus.",
        biological:
        "Hikayatin ang natural predators tulad ng lady beetles at lacewings para tulungan kontrolin ang aphids sa field.",
      ),
      prevention:
      "Gumamit ng certified virus-free planting materials, magtanim ng resistant varieties, at kontrolin ang insect vectors nang maaga. Iwasan ang paggamit ng infected cuttings, panatilihin ang field sanitation, at regular na i-monitor para sa early mosaic symptoms.",
    ),

    DiseaseModel(
      id: "sugarcane_red_rot",
      name: "Sugarcane Red Rot",
      severity: "MATAAS NA PELIGRO",
      description:
      "Ang Sugarcane red rot ay isang severe fungal disease na dulot ng Colletotrichum falcatum. Inaatake nito ang internal tissues ng tubo, na nagdudulot ng pagiging red at later ay pagkabulok, na madalas may foul smell. Ang external symptoms ay kinabibilangan ng yellowing, drying ng dahon, at splitting ng stalks. Ang sakit ay kumakalat sa pamamagitan ng infected planting materials at contaminated tools, lalo na sa warm at humid na kondisyon.",
      treatments: TreatmentPlan(
        immediateAction:
        "Bunutin at wasakin ang infected na sugarcane stalks nang lubusan, kasama ang roots, at iwasan ang paggamit nito bilang planting materials.",
        organic:
        "Mag-apply ng well-decomposed organic manure at compost para mapabuti ang soil health at plant resistance.",
        chemical:
        "Walang fully effective chemical cure kapag nahawa na. Maaaring gamitin ang fungicides bilang preventive sprays sa kalapit na malulusog na crops, ngunit ang control ay mainly hindi chemical-based.",
        biological:
        "Gumamit ng Trichoderma species sa lupa para tulungan ma-suppress ang fungal pathogens at mabawasan ang pagkalat ng sakit.",
      ),
      prevention:
      "Magtanim ng certified disease-free at resistant varieties, practice crop rotation, at iwasan ang waterlogging. Mapabuti ang field drainage, iwasan ang ratoon cropping mula sa infected fields, at i-disinfect ang cutting tools bago gamitin.",
    ),

    DiseaseModel(
      id: "sugarcane_rust",
      name: "Sugarcane Rust",
      severity: "KATAMTAMANG PELIGRO",
      description:
      "Ang Sugarcane rust ay isang fungal disease na pangunahing dulot ng Puccinia melanocephala. Lumalabas ito bilang maliliit na yellow spots sa dahon na nagde-develop into reddish-brown o orange pustules, na nagre-release ng spores na madaling kumalat sa pamamagitan ng hangin. Ang severe na infection ay bumabawas ng leaf function, pahinain ang halaman, at puwedeng bawasan ang sugar yield. Ang sakit ay thrive sa warm, humid na kondisyon.",
      treatments: TreatmentPlan(
        immediateAction:
        "Alisin at wasakin ang heavily infected na dahon para mabawasan ang spore spread sa loob ng field.",
        organic:
        "Gumamit ng neem-based sprays o botanical extracts para tulungan pabagalin ang early fungal development.",
        chemical:
        "Mag-apply ng fungicides tulad ng propiconazole, azoxystrobin, o mancozeb sa early signs ng infection, lalo na sa humid na kondisyon.",
        biological:
        "Mag-apply ng beneficial fungi tulad ng Trichoderma spp. para mapabuti ang plant resistance at mabawasan ang fungal activity sa environment.",
      ),
      prevention:
      "Magtanim ng rust-resistant sugarcane varieties, panatilihin ang proper spacing, at iwasan ang continuous sugarcane cropping sa parehong field. Iwasan ang excess nitrogen fertilizer, mapabuti ang air circulation sa tamang spacing, at regular na i-monitor ang crops tuwing wet seasons.",
    ),

    DiseaseModel(
      id: "sugarcane_yellow_leaf",
      name: "Sugarcane Yellow Leaf Disease",
      severity: "KATAMTAMANG PELIGRO",
      description:
      "Ang Sugarcane yellow leaf disease ay isang viral infection na nagdudulot ng pagkuyellow ng midrib at veins sa dahon ng tubo. Ang mga infected na halaman ay nagpapakita ng reduced growth, lower sugar content, at overall decline. Ang virus ay kumakalat sa pamamagitan ng aphids at infected planting materials. Tulad ng iba pang viral diseases, walang direktang lunas kaya ang pag-iwas at paggamit ng malinis na planting materials ang pinakamahusay na estratehiya.",
      treatments: TreatmentPlan(
        immediateAction:
        "Alisin at wasakin ang heavily infected na halaman at dahon para maiwasan ang pagkalat sa ibang bahagi ng field.",
        organic:
        "Gumamit ng neem-based sprays o compost extracts para suportahan ang plant defense at mabawasan ang aphid attraction.",
        chemical:
        "Walang direct chemical cure. Maaaring gumamit ng insecticides (hal. imidacloprid) para kontrolin ang aphids na nagta-transmit ng virus.",
        biological:
        "Mag-apply ng beneficial fungi tulad ng Trichoderma spp. para mapabuti ang overall plant health at resistance.",
      ),
      prevention:
      "Gumamit ng certified virus-free planting materials, magtanim ng resistant varieties kung available, at kontrolin ang insect vectors nang maaga. Iwasan ang paggamit ng infected cuttings, panatilihin ang field sanitation, at regular na i-monitor para sa early symptoms ng pagkuyellow ng dahon.",
    ),

    // ==================== UNKNOWN / ERROR HANDLING ====================
    DiseaseModel(
      id: "unknown",
      name: "Hindi Kilalang Sakit",
      severity: "HINDI TUKOY",
      description:
      "Hindi nakilala ng sistema ang sakit o kondisyon ng halaman. Maaaring kumuha ng mas malinaw na litrato o kumonsulta sa lokal na agricultural expert para sa tamang diagnosis.",
      treatments: TreatmentPlan(
        immediateAction:
        "Kumuha ng mas malinaw at well-lit na litrato ng apektadong bahagi ng halaman. Siguraduhing kasama ang buong dahon o bahagi ng halaman sa kuha.",
        organic:
        "Panatilihin ang malusog na lupa gamit ang compost at organic matter habang hinihintay ang tamang diagnosis.",
        chemical:
        "Hindi inirerekomenda ang pag-apply ng anumang chemical hangga't hindi pa tukoy ang sakit.",
        biological:
        "Panatilihin ang beneficial microorganisms sa lupa sa pamamagitan ng paggamit ng compost at iwasan ang sobrang paggamit ng chemicals.",
      ),
      prevention:
      "Regular na i-monitor ang kalagayan ng halaman, panatilihing malinis ang farm, at agad na kumonsulta sa expert kapag may nakitang abnormal na sintomas.",
    ),
  ];

  static DiseaseModel? getById(String id) {
    try {
      return diseases.firstWhere((d) => d.id == id);
    } catch (_) {
      return null;
    }
  }

  static DiseaseModel get unknown =>
      diseases.firstWhere((d) => d.id == 'unknown');
}