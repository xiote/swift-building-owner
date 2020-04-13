@testable import Parser
import XCTest
import XMLCoder

final class ParserTests: XCTestCase {
    func testParse() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.

        let input = """
        {"sigungu_cd":41410}
        """
        let want = OwnerInfo(sigunguCd: 41410)

        let data = input.data(using: .utf8)!
        let got: OwnerInfo = try! JSONDecoder().decode(OwnerInfo.self, from: data)
        XCTAssertEqual(got, want)
    }

    func testParseXml() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.

        let input = """
        <item>
            <sigungu_cd>41410</sigungu_cd>
        </item>
        """
        let want = OwnerInfo(sigunguCd: 41410)

        let data = input.data(using: .utf8)!
        let got: OwnerInfo = try! XMLDecoder().decode(OwnerInfo.self, from: data)
        XCTAssertEqual(got, want)
    }

    func testDecodeXml() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.

        let input = """
        <response>
        <header>
        <resultCode>00</resultCode>
        <resultMsg>NORMAL SERVICE.</resultMsg>
        </header>
        <body>
        <items>
        <item>
        <mgm_bldrgst_pk>41410-66617</mgm_bldrgst_pk>
        <sigungu_cd>41410</sigungu_cd>
        <sigungu_nm>군포시</sigungu_nm>
        <bjdong_cd>10400</bjdong_cd>
        <bjdong_nm>산본동</bjdong_nm>
        <plat_gb_cd>0</plat_gb_cd>
        <plat_gb_nm>대지</plat_gb_nm>
        <bun>1156</bun>
        <ji>0001</ji>
        <splot_nm/>
        <block/>
        <lot/>
        <na_plat_plc> 경기도 군포시 번영로 380</na_plat_plc>
        <na_road_cd>414103200025</na_road_cd>
        <na_bjdong_cd>10402</na_bjdong_cd>
        <na_ugrnd_cd>0</na_ugrnd_cd>
        <na_ugrnd_nm>지상</na_ugrnd_nm>
        <na_main_bun>380</na_main_bun>
        <na_sub_bun/>
        <regstr_gb_cd>2</regstr_gb_cd>
        <regstr_gb_nm>집합</regstr_gb_nm>
        <regstr_kind_cd>4</regstr_kind_cd>
        <regstr_kind_nm>전유부</regstr_kind_nm>
        <bld_nm>주공4단지</bld_nm>
        <dong_nm>406동</dong_nm>
        <ho_nm>209호</ho_nm>
        <area>51.66</area>
        <own_gb_cd>01</own_gb_cd>
        <own_gb_nm>개인</own_gb_nm>
        <jm_gb_cd>1</jm_gb_cd>
        <jm_gb_nm>내국인</jm_gb_nm>
        <nm>김**</nm>
        <jmno/>
        <quota1/>
        <quota2/>
        <ownsh_quota/>
        <chang_caus_day>20080226</chang_caus_day>
        <loc_sigungu_cd/>
        <loc_sigungu_nm> </loc_sigungu_nm>
        <loc_bjdong_cd/>
        <loc_bjdong_nm> </loc_bjdong_nm>
        <loc_detl_addr>경기도 군포시 산본동 1156-1 한라아파트 406동 209호</loc_detl_addr>
        <na_loc_plat_plc> </na_loc_plat_plc>
        <na_loc_road_cd/>
        <na_loc_bjdong_cd/>
        <na_loc_detl_addr/>
        <na_loc_ugrnd_cd/>
        <na_loc_ugrnd_nm/>
        <na_loc_main_bun/>
        <na_loc_sub_bun/>
        </item>
        </items>
        <numOfRows>10</numOfRows>
        <pageNo>1</pageNo>
        <totalCount>1425</totalCount>
        </body>
        </response>
        """
        let ownerInfo = OwnerInfo(sigunguCd: 41410)
        let items = Items(item: [ownerInfo])
        let header = Header(resultCode: "00", resultMsg: "NORMAL SERVICE.")
        let body = Body(numOfRows: 10, pageNo: 1, totalCount: 1425, items: items)
        let want = Response(header: header, body: body)

        let returnData = try? XMLEncoder().encode(want, withRootKey: "response")
        print(String(data: returnData ?? Data(), encoding: String.Encoding.utf8))

        let data = input.data(using: .utf8)!
        let got: Response = try! XMLDecoder().decode(Response.self, from: data)
        XCTAssertEqual(got, want)
    }
}
