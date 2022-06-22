package entities;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the hoadon database table.
 * 
 */
@Entity
@NamedQuery(name="Hoadon.findAll", query="SELECT h FROM Hoadon h")
public class Hoadon implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private int status;

	@Column(name="thanh_toan")
	private int thanhToan;

	private int tongTien;

	//bi-directional many-to-one association to User
	@ManyToOne
	private User user;

	public Hoadon() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getStatus() {
		return this.status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getThanhToan() {
		return this.thanhToan;
	}

	public void setThanhToan(int thanhToan) {
		this.thanhToan = thanhToan;
	}

	public int getTongTien() {
		return this.tongTien;
	}

	public void setTongTien(int tongTien) {
		this.tongTien = tongTien;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}