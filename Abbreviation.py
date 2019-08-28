from collections import defaultdict

def abbreviation(a, b):
    aCount = defaultdict(int)
    bCount = defaultdict(int)

    for ch in a:
        aCount[ch] += 1

    for ch in b:
        bCount[ch] += 1

    print(aCount)
    print(bCount)
    for ch in a:
        if ch.isupper():
            chLow = ch.lower()
            if bCount[ch] is None and bCount[chLow] is None:
                return "NO"
            chBSum = bCount[ch] + bCount[chLow]
            if chBSum < aCount[ch]:
                return "NO"

    for ch in b:
        if ch.isupper():
            chLow = ch.lower()
            if aCount[ch] is None and aCount[chLow] is None:
                return "NO"
            chASum = aCount[ch] + aCount[chLow]
            if chASum < bCount[ch]:
                return "NO"
    return "YES"


# print(abbreviation(a="AbcDE", b="ABDE"))
# print(abbreviation(a="AbcDE", b="AFDE"))


inputs = ["OPZFFVQLADBQFBXLOSUMZZWQUKASCUVQZZVWfPIRTytlvpijddqegbwitkhhsbuehtnpndvcandzjzyepvlnkayfkwzegvbratvwezddjqxrxocqgcghuohlmsondvicocltqhvqfqjpctxfomjoukrheijhhndcbipiobvpbskemgykepokluwqhhejdaimvdvlegfyrrwckgojsbsxmsvhhrlnvcrxfaxinjzsjgvvrlcczqlkvgtftsvktvhtfpaklumhkovphilrappbvkarfhvwxxtrugypracozyqyvaqjityoiyemyavpbchaoagrvujocpueczsgcqdjvkjckxhmnaseshjgecusrxozuxgeieleewwskmiprlqnshvmcp",
"OPZFFVQLADBQFBXLOSUMZZWQUKASCUVQZZVWPIRT",
"WLWlVFFTKWXXVNXUAHAWBKCQMKEHKSJNLLISGUWMDTkURJTLXyJFEHQYTCuRFXRDHSFPIRCCQSDRRHCSDPKXGOCHFAWKPGMCZICTFFTNZBANHHELBMAWVPRekbsqbxqqwsizsjnnorxamaoudznbaqanqtucsrouxcdxfqahygyupaxfvtvigahlkpoduwmgvbvwshvazgsjkimnbjvzvwtdlomsfatfxxsfdvxcyfiycehomhhaaginwnrtoqtkhvmjikzymaqppjbtjomfjn",
"WLWVFFTKWXXVNXUAHAWBKCQMKEHKSJNLLISGUWMDTURJTLXJFEHQYTCRFXRDHSFPIRCCQSDRRHCSDPKXGOCHFAWKPGMCZICTFFTNZBANHHELBMAWVPR",
"PDXCyKDOkWPOTXQUEQHOEIaIAROHeAXrGISVQbnksreozjryuzlttptkufhzaqejqszwsscpsbrfjrqaixtfvazzihgrnkgrultyewhaniegnzqapbzugermphypdryqcobcglcytzcysjbuchazswrvckkmwgityneeyqeflcyhesmdhsskudnsuqtlvpplothlpilpffyuyvnjvymiwrrqappuwbinbgcb",
"PDXCKDOWPOTXQUEQHOEIIAROHAXGISVQ",
"RUJNEGMMMEGIRGILRHKWKSNZWMQAFKISNVVBOVNZBHRITDHZIKHXuZRRJOVNHIKLBIZTTHQCDRDDPQIWIJRAKXSAFKNZQQTUCGYBKKIFJBKYDLICJZZCDSHRCKRNXTNZAKNNFPLCLBMJJGOZLIIJYFIMYHPNHLXGZICXOCDNWKKEMGOSJUGVXIEGBWLNGXUQNBWKJIUURRBZYBKEVUSDUpAUQKVANNJWNJZZAIJCYTJPUMIYAFJKBBCEDOGWVUCTBRhHXTTZDFTPYTypxornxsclmxzsuwaqlsjwpztodbwnowpplxcvbpubodwobdlwphmcyenwdjwdzwblrejfhvoprxsiekxz",
"RUJNEGMMMEGIRGILRHKWKSNZWMQAFKISNVVBOVNZBHRITDHZIKHXZRRJOVNHIKLBIZTTHQCDRDDPQIWIJRAKXSAFKNZQQTUCGYBKKIFJBKYDLICJZZCDSHRCKRNXTNZAKNNFPLCLBMJJGOZLIIJYFIMYHPNHLXGZICXOCDNWKKEMGOSJUGVXIEGBWLNGXUQNBWKJIUURRBZYBKEVUSDUAUQKVANNJWNJZZAIJCYTJPUMIYAFJKBBCEDOGWVUCTBRHXTTZDFTPYT",
"CIVQEESyFYnGDSSUUUGMPXYUKRMLXRXtWAWKQRUWCXKBMTGDOWSPRFOCUOETTLIWeXTUHSSPWYQKJSIlRJGOIDARFIILFXQUBCXUQHJCtJXTJBOSJKJUAIFaBVQWBXWZIYRMYOCVYGTCJJjDMBAESZlXMDPIREZHVJGJQHAFQGGXLzIEAPcZGBOEHDXQIUDfBEYQOjTYJUJVTWEIXcBUYEyXHPDYAEHOZDPHAQAYEQNKoVBOOMTUOJHyFOLRmVKMwFVCJMTAMFVPAGYYIBZZLCPJYXLWXMHLVXXQOGSZKGZZOENOSNHJNOMXxNMRZGODIUnEZGRDFLNuZJASKXHMSJGIWGIUYWPPXQQZYDSISXFQRPLHFPHMZMGMVOLXeJWYZOZUEOHWZOFUQEGEGLPRISELSNHIGDlLqEDCCDJYKAFTLLPIYUQENFuWJJFHUAECO",
"CIVQEESFYGDSSUUUGMPXYUKRMLXRXWAWKQRUWCXKBMTGDOWSPRFOCUOETTLIWXTUHSSPWYQKJSIRJGOIDARFIILFXQUBCXUQHJCJXTJBOSJKJUAIFBVQWBXWZIYRMYOCVYGTCJJDMBAESZXMDPIREZHVJGJQHAFQGGXLIEAPZGBOEHDXQIUDBEYQOTYJUJVTWEIXBUYEXHPDYAEHOZDPHAQAYEQNKVBOOMTUOJHFOLRVKMFVCJMTAMFVPAGYYIBZZLCPJYXLWXMHLVXXQOGSZKGZZOENOSNHJNOMXNMRZGODIUEZGRDFLNZJASKXHMSJGIWGIUYWPPXQQZYDSISXFQRPLHFPHMZMGMVOLXJWYZOZUEOHWZOFUQEGEGLPRISELSNHIGDLEDCCDJYKAFTLLPIYUQENFWJJFHUAECOMN",
"VUWELCNJMNWLMJLZRASXaZCTBXKLLELZNWNZXNBTAPKRBBsXBJHMBDPDQDIFCXHXWNVMTFHSNAJhRSUAIAXLNICSBCIOLOAMAOAPGJVXEFBGEFCKQzMAFTVZKMGIXEKVWMbQPZTFHVLSQGBXEaFRKAMMICCGDPXWGZTGJWRCRBQIpCRBIAYRDXLMWNGEUMELKAZANQBLKTTVKQJOSZRNHUJBNDFTNFJVUNrGWKWALLBERYEgXMSXRMWHKQIFRQELUHOFGVyLESCNBWOSTOPRQYIDDTWNUCrBOOUMTLKNDRXTDPGQQERPFRJQEGEFLDUayvvmqaaypkxezuhsopxexsnfdaxc",
"VUWELCNJMNWLMJLZRASXZCTBXKLLELZNWNZXNBTAPKRBBXBJHMBDPDQDIFCXHXWNVMTFHSNAJRSUAIAXLNICSBCIOLOAMAOAPGJVXEFBGEFCKQMAFTVZKMGIXEKVWMQPZTFHVLSQGBXEFRKAMMICCGDPXWGZTGJWRCRBQICRBIAYRDXLMWNGEUMELKAZANQBLKTTVKQJOSZRNHUJBNDFTNFJVUNGWKWALLBERYEXMSXRMWHKQIFRQELUHOFGVLESCNBWOSTOPRQYIDDTWNUCBOOUMTLKNDRXTDPGQQERPFRJQEGEFLDU",
"ETAUMPZFGJVEUUBFDIMJPMOCRQXMMMYPUKFRJLCXOCLMUMMUHQNKIAZSKHRLPNhRRPmNIBNCHRZBYWAPUNMDFGPDKQUBZYPEIZILJEHNZGHSNSRZACYCKQSSFHEDYCMVAovcuyjahwtmgcctvjqnpgwrurwnmbifbtyqyuoafezegpecjgmkwfstjwlkromioak",
"ETAUMPZFGJVEUUBFDIMJPMOCRQXMMMYPUKFRJLCXOCLMUMMUHQNKIAZSKHRLPNRRPNIBNCHRZBYWAPUNMDFGPDKQUBZYPEIZILJEHNZGHSNSRZACYCKQSSFHEDYCMVA",
"KBJYYWPSOMDASRHPARGRyOZaAOEWVDTRWRKVGsgRWeVWCUVTCLYLGLZQAUHOOLJKPUCTCYJIWOKkEGRAOJAQLZABAYXHBdLptHZYVFMZCCGAQJShlHXHVCZFCBGPZDZGQHFVGLHBBvDNSUPYNJMOYHZMXRAHUZHCjNtTWSJGDUKJbRBgJRTVtHGHLKKTHBMtPMQVTKNRNOlSCBMXWJJZHFTHBNMNOBBYQTDXREdHwVBHQqKUSEDVYAEcYLGGvQKaUORVFUOFPTXGGQiLOKFRkGXBYNEQZXDFQBmPvFBUFEBNOFVQHjRJVQHsPJNXBOTKLMVRDPHXNNHwVPlKQJLWUYYAFOIUNhARELQUaBYxHRFqXGLRMFGOMPRKLZLRNRJDLJHDLMHKALTKSW",
"KBJYYWPSOMDASRHPARGROZAOEWVDTRWRKVGRWVWCUVTCLYLGLZQAUHOOLJKPUCTCYJIWOKEGRAOJAQLZABAYXHBLHZYVFMZCCGAQJSHXHVCZFCBGPZDZGQHFVGLHBBDNSUPYNJMOYHZMXRAHUZHCNTWSJGDUKJRBJRTVHGHLKKTHBMPMQVTKNRNOSCBMXWJJZHFTHBNMNOBBYQTDXREHVBHQKUSEDVYAEYLGGQKUORVFUOFPTXGGQLOKFRGXBYNEQZXDFQBPFBUFEBNOFVQHRJVQHPJNXBOTKLMVRDPHXNNHVPKQJLWUYYAFOIUNARELQUBYHRFXGLRMFGOMPRKLZLRNRJDLJHDLMHKALTKSWGTVBRLNKGBW",
"UZJMUCYHpfeoqrqeodznwkxfqvzktyomkrVyzgtorqefcmffauqhufkpptaupcpxguscmsbvolhorxnjrheqhxlgukjmgncwyastmtgnwhrvvfgbhybeicaudklkyrwvghpxbtpyqioouttqqrdhbinvbywkjwjkdiynvultxxxmwxztglbqitxmcgiusfewmsvxchkryzxipbmgrnqhfmlghomfbsKjglimxuobomfwutwfcmklzcphbbfohnaxgbaqbgocghaaizyhlctupndmlhwwlxxvighhjjrctcjBvxtagxbhrbrWwsyiiyebdgyfrlztoycxpjcvmzdvfeYqaxitkfkkxwybydcwsbdiovrqwkwzbgammwslwmdesygopzndedsbdixvi",
"UZJMUCYH",
"AITDVQYyBXUHBBTXvJOCCHGHXPWOYEHSKNAQHSDIWJHKDYMODFAYKNYAJUFCQZPAVTZYPbJFRDYSuDNYMFRKADBTQOBXSNeWDQYHBSLMTDdZiUJECURIEBZPNRByMAQNNGXGHAWTOKAKOAVgPDEAOEPSZHGNISBHVLIDRMNAFBHGPBYRhdJEPKLOOlYnJYXEOSWCOGEEWJDPKQXEDGUSZSAYzWLWQEVFHBTLAFTFZTXkQJWEHVaRFNTAEQDJVYKSBAFNUfGJMByRKINGTSLBIEDCMFOHGmICOCKGPZXHglLBUWUUTTSBNVQceMIEwKAOWAANJYqYKoYIOXtYHDKDNVVZOKPJvTLKoKBJMAEMSVUFKYQTSGXNDQLEAdUAzIXGOSWCLXFVTAWSQDWDCLdARUIQRFRSMBQACKAGLMGYFCCJMTLSOEPJXIIIZSPBXvHeYFVMjcarjwckioyvkzzjfytwcqzkrqukjxhvmywrcbulvznma",
"AITDVQYBXUHBBTXJOCCHGHXPWOYEHSKNAQHSDIWJHKDYMODFAYKNYAJUFCQZPAVTZYPJFRDYSDNYMFRKADBTQOBXSNWDQYHBSLMTDZUJECURIEBZPNRBMAQNNGXGHAWTOKAKOAVPDEAOEPSZHGNISBHVLIDRMNAFBHGPBYRJEPKLOOYJYXEOSWCOGEEWJDPKQXEDGUSZSAYWLWQEVFHBTLAFTFZTXQJWEHVRFNTAEQDJVYKSBAFNUGJMBRKINGTSLBIEDCMFOHGICOCKGPZXHLBUWUUTTSBNVQMIEKAOWAANJYYKYIOXYHDKDNVVZOKPJTLKKBJMAEMSVUFKYQTSGXNDQLEAUAIXGOSWCLXFVTAWSQDWDCLARUIQRFRSMBQACKAGLMGYFCCJMTLSOEPJXIIIZSPBXHYFVM"]


expected = [
"YES",
"YES",
"YES",
"YES",
"NO",
"YES",
"YES",
"NO",
"NO",
"YES"
]

# print(len(inputs))
# for i in range(10):
#     a = inputs[i*2]
#     b = inputs[i*2 + 1]
#     res = abbreviation(a=a, b=b)
#     if expected[i] != res:
#         print(f"Case {i} {i*2}:{i*2+1} failed")

print(inputs[8])
print("\n")
print(inputs[9])
abbreviation(a=inputs[8], b=inputs[9])
dc1 = defaultdict(int)
dc2 = defaultdict(int)
for ch in inputs[8]: dc1[ch] += 1
for ch in inputs[9]: dc2[ch] += 1


for k, v in dc1.items():
    if dc2[k] != dc1[k] and k.isupper():
        print(k)

for k, v in dc2.items():
    if dc1[k] != dc2[k] and k.isupper():
        print(k)

